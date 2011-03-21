def new_practice_member_dialog_present?
  return selector_cell_selected?('New PM') && has_text?('New Practice Member', 'h1')
end

def find_dialog_present?
  return selector_cell_selected?('Find') && has_text?('All', 'td') && has_text?('0-9', 'td')
end

def feedback_support_dialog_present?
  return selector_cell_selected?('Feedback/Support') && has_text?('Feedback & Support', 'h1')
end

def lineup_dialog_present?
  return selector_cell_present?('Lineup') && has_text?('Lineup')
end
