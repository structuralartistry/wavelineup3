module HomeHelper
  def set_max_stat_value(actual_stat_value)
    max_stat_value = actual_stat_value + (actual_stat_value * 0.5).to_i
    max_stat_value = 10 if max_stat_value < 1
    max_stat_value
  end
end
