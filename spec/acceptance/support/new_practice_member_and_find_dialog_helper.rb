def new_practice_member_dialog_present?
  return selector_cell_selected?('New Practice Member') && has_text?('New Practice Member', 'h1')
end

def find_dialog_present?
  return selector_cell_selected?('Find') && has_text?('All', 'td') && has_text?('0-9', 'td')
end
