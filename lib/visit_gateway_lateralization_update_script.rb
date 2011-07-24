Visit.all.each do |visit|
  puts "Processing Visit id #{visit.id}"
  travel_card = visit.practice_member.travel_card

  set_gateways = %w(visit.phase_1_gateway_1
                    visit.phase_1_gateway_2
                    visit.phase_1_gateway_1_affecting
                    visit.phase_1_gateway_2_affecting

                    visit.phase_2_gateway_1
                    visit.phase_2_gateway_2
                    visit.phase_2_gateway_1_affecting
                    visit.phase_2_gateway_2_affecting)
  set_gateways.each |set_visit_gateway|
    puts "  set_visit_gateway: #{set_visit_gateway}"
    set_gateway_text = eval(set_visit_gateway)
    puts "    set_gateway_text: #{set_gateway_text}"
    if set_gateway_text
      normalized_gateway = 'gateway_' + set_visit_gateway_text.downcase.gsub(/\//,'_')
      puts "    normalized_gateway: #{normalized_gateway}"
      gateway_side = eval("travel_card.#{normalized_gateway}").strip
      puts "    gateway_side: #{gateway_side}"
      if gateway_side =~ /[L]/
        eval_expn = "set_visit_gateway = 'L ' + #{set_gateway_text}"
        puts "    eval_expn: #{eval_expn}"
        eval(eval_expn)
      elsif gateway_side =~ /[R]/
        eval_expn = "set_visit_gateway = 'R ' + #{set_gateway_text}"
        puts "    eval_expn: #{eval_expn}"
        eval(eval_expn)
      end
    end
  end
  puts "    visit.inspect: #{visit.inspect}"
  visit.save!
end

