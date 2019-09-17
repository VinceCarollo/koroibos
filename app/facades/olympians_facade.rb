class OlympiansFacade
  def initialize(params)
    @params = params
  end

  def self.olympians(params)
    new(params).get_olympians
  end

  def get_olympians
    if @params[:age]
      render_by_age
    else
      {olympians: Olympian.with_sport.map{|olympian| OlympianSerializer.new(olympian)}}
    end
  end

  private

  def render_by_age
    case @params[:age].downcase
    when 'oldest'
      [Olympian.oldest]
    when 'youngest'
      [Olympian.youngest]
    end
  end
end
