module HomeHelper
  def latest_time r
    t = r.blank? ? Time.current : Time.zone.at(r.birth_mark)
    t.strftime("%Y-%m-%d %H:%M:%S")
  end
end
