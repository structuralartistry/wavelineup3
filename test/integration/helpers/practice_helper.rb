def create_practice(name)
  practice = Factory.create(:practice, :name => name)
  Factory.create(:user, :email => "#{name.downcase.gsub(' ', '')}@structuralartistry.com", :practice_id => practice.id)
  return practice
end