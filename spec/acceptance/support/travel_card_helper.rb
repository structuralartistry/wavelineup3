def confirm_travel_card_loaded
  has_text?('DO', 'td').should==true
  has_text?('LOC', 'td').should==true
  has_text?('Rsp Wv', 'td').should==true
end