class ScreenParser
  def initialize(xmdm)
    @xmdm = xmdm
  end

  # 第一步，根据 XMDM-项目代码 
  # 查询 CDJG-菜单结构 表
  def get_cdjg
    @cdjg = Cdjg.where(xmdm: @xmdm).first
  end

  # 第二步，根据 cdjg 记录的 JYDM-交易代码
  # 查询 JYLD-交易联动 获取所有子交易
  # 获取的所有子交易要根据 XH-序号 排序
  def get_jylds
    if @cdjg.present?
      @jylds = Jyld.where(jydm: @cdjg.jydm).sort do |a, b|
        a.xh <=> b.xh
      end
    else
      @jylds = []
    end
  end

  # 第三步，根据每个子交易
  # 查询 JYZB-交易主表 得知每个子交易对应的交易屏幕
  def get_jypms
    # 根据自身交易码 + 子交易码查询
    jyms = @jylds.map do |x|
      {zjym: x.zjym, xh: x.xh}
    end
    jyms = [{zjym: @cdjg.jydm, xh: 0}] + jyms

    # ap jyms

    @screen_data = jyms.map do |x|
      begin
        jyzb = Jyzb.where(jydm: x[:zjym]).first
        
        if jyzb.present?
          {
            jydm: jyzb.jydm,
            jymc: jyzb.jymc,
            xh: x[:xh],
            sr: [
              jyzb.srpmh1,
              jyzb.srpmh2,
              jyzb.srpmh3,
              jyzb.srpmh4,
              jyzb.srpmh5,
              jyzb.srpmh6,
              jyzb.srpmh7,
              jyzb.srpmh8,
            ].select {|x| x.present?},
            xy: jyzb.xypmh,
            fh: jyzb.fhpmh
          }
        else
          nil
        end
      rescue => e
        ap x
        # ap @jylds.count
        nil
      end
    end

    @screen_data.compact!
  end

  # 第四步
  # 根据每个屏幕编号查询屏幕字段
  def get_screen_zds
    @result = @screen_data.map { |x|
      data = {}
      data[:jydm] = x[:jydm]
      data[:jymc] = x[:jymc]
      data[:xh] = x[:xh]

      if x[:sr].present?
        data[:input_screens] = x[:sr].map { |y|
          get_hmzds(y)
        }
      end

      if x[:xy].present?
        data[:response_screen] = get_hmzds(x[:xy])
      end

      if x[:fh].present?
        data[:compound_screen] = get_hmzds(x[:fh])
      end

      data
    }
  end

  def get_hmzds(hmdm)
    zds = Hmzd.where(hmdm: hmdm)
      .map {|x|
        data = {
          zdxh: x[:zdxh],
          zdbt: (x[:zdbt] || "").strip,
          sjbm: x[:sjbm],
          zdcd: x[:zdcd],
          xssx: x[:xssx],
          sjlx: x[:sjlx],
          zdlx: x[:zdlx],
          sjbm: (x[:sjbm] || "").strip,
          czfs: x[:czfs],
          xxdm: x[:xxdm],
          qsh: x[:qsh],
          qsl: x[:qsl]
        }
        # # 下拉选项内容
        # if x[:xxdm].present?
        #   data[:xxmxs] = Xxmx.where(xxdm: x[:xxdm])
        # end
        data
      }.sort {|a, b|
        a[:zdxh] <=> b[:zdxh]
      }
    {
      hmdm: hmdm,
      zds: zds
    }
  end

  def parse
    get_cdjg
    return false if @cdjg.blank?

    get_jylds
    # ap @jylds.map{|x| {jydm: x.jydm, jymc: x.jymc}}
    get_jypms
    # ap @screen_data
    get_screen_zds
  end

  def result
    @result
  end
end

def export(xmdm)
  sp = ScreenParser.new xmdm
  if sp.parse
    File.open("export/#{xmdm}.json", 'w') do |f|
      f.write sp.result.to_json
    end
  end
end

# 172001
# export 172001

# 114600 查询客户号
# export 114600

data = JSON.parse File.read 'all_transactions.json'
data.each do |d|
  ap "exporting.. #{d['id']}"
  export d['id']
end