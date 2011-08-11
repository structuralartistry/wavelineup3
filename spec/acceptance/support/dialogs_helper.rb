def new_practice_member_dialog_present?
  return selector_cell_selected?('New PM') && has_text?('New Practice Member', 'h1')
end

def practice_member_selector_present?
  return has_text?('Select Target Page','h1') && has_text?('Filter Names','h1') && has_text?('Go','h1') && has_text?('All', 'td') && has_text?('0-9', 'td')
end

def find_practice_member_selector_present?
  return has_text?('Select Target Page','h1') && generic_practice_member_selector_present?
end

def generic_practice_member_selector_present?
  return has_text?('Filter Names','h1') && has_text?('Go','h1') && has_text?('All', 'td') && has_text?('0-9', 'td')
end

def feedback_support_dialog_present?
  return selector_cell_selected?('Feedback/Support') && has_text?('Feedback & Support', 'h1')
end

def lineup_dialog_present?
  return selector_cell_present?('Lineup') && has_text?('Lineup')
end
