module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    when /^the edit travel card page for Practice Member "([^"]*)"$/
      practice_member = parse_practice_member_formal_name($1)
      practice_member = PracticeMember.where("name_last='#{practice_member.name_last}' and name_first='#{practice_member.name_first}' and name_middle='#{practice_member.name_middle}'").first
      travel_card = TravelCard.find_by_practice_member_id(practice_member.id)
      "/travel_cards/#{travel_card.id}/edit"

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
