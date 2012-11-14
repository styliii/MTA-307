module UsersHelper

  def subway_lines_to_select
    SubwayLine.all.collect{|s| [s.name, s.id]}
  end
end
