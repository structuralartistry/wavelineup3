task :illuminare_seed => :environment do
  # rails_root = Rails.root.to_s
  # require "#{rails_root}/app/models/practice_member.rb"
  # require "#{rails_root}/app/models/travel_card.rb"
  puts "Expected to import 326 pms"
  illuminare_pms = PracticeMember.where("practice_id = 3")
  puts "Before import Illuminare has #{illuminare_pms.size} pms"
  
  pm = PracticeMember.create(:last_name => 'Abate', :first_name => 'Louis', :middle_name => '', :practice_id => 3); puts 'Failed to import Abate, Louis' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rebek', :first_name => 'Tom', :middle_name => '', :practice_id => 3); puts 'Failed to import Rebek, Tom' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Marolla', :first_name => 'Austin', :middle_name => '', :practice_id => 3); puts 'Failed to import Marolla, Austin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Debuck', :first_name => 'Francyne', :middle_name => '', :practice_id => 3); puts 'Failed to import Debuck, Francyne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Champrenaud', :first_name => 'Claude', :middle_name => '', :practice_id => 3); puts 'Failed to import Champrenaud, Claude' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Foti', :first_name => 'Enzo', :middle_name => '', :practice_id => 3); puts 'Failed to import Foti, Enzo' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lewis', :first_name => 'Suzy', :middle_name => '', :practice_id => 3); puts 'Failed to import Lewis, Suzy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Vosper', :first_name => 'Paige', :middle_name => '', :practice_id => 3); puts 'Failed to import Vosper, Paige' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Badillo', :first_name => 'Stephanie', :middle_name => '', :practice_id => 3); puts 'Failed to import Badillo, Stephanie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Miller', :first_name => 'Lorraine', :middle_name => '', :practice_id => 3); puts 'Failed to import Miller, Lorraine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Passarelli-Aitchinson', :first_name => 'Michelle', :middle_name => '', :practice_id => 3); puts 'Failed to import Passarelli-Aitchinson, Michelle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Fisk', :first_name => 'Peter', :middle_name => '', :practice_id => 3); puts 'Failed to import Fisk, Peter' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Luzzi', :first_name => 'Kim', :middle_name => '', :practice_id => 3); puts 'Failed to import Luzzi, Kim' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Boros', :first_name => 'Frank', :middle_name => '', :practice_id => 3); puts 'Failed to import Boros, Frank' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Nuse', :first_name => 'Kyle', :middle_name => '', :practice_id => 3); puts 'Failed to import Nuse, Kyle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'O\'Kelley', :first_name => 'Shannon', :middle_name => '', :practice_id => 3); puts 'Failed to import O\'Kelley, Shannon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Leathern', :first_name => 'Amanda', :middle_name => '', :practice_id => 3); puts 'Failed to import Leathern, Amanda' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bruce', :first_name => 'Apryl', :middle_name => '', :practice_id => 3); puts 'Failed to import Bruce, Apryl' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rothstein', :first_name => 'Jay', :middle_name => '', :practice_id => 3); puts 'Failed to import Rothstein, Jay' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sherman', :first_name => 'Robin', :middle_name => '', :practice_id => 3); puts 'Failed to import Sherman, Robin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Epstein', :first_name => 'Donald', :middle_name => '', :practice_id => 3); puts 'Failed to import Epstein, Donald' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Abate-Emde', :first_name => 'Maria', :middle_name => '', :practice_id => 3); puts 'Failed to import Abate-Emde, Maria' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Abate', :first_name => 'Frank', :middle_name => '', :practice_id => 3); puts 'Failed to import Abate, Frank' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Monford', :first_name => 'Jeff', :middle_name => '', :practice_id => 3); puts 'Failed to import Monford, Jeff' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dove', :first_name => 'Simon', :middle_name => '', :practice_id => 3); puts 'Failed to import Dove, Simon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mossman', :first_name => 'Mindy', :middle_name => '', :practice_id => 3); puts 'Failed to import Mossman, Mindy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hunter', :first_name => 'Victoria', :middle_name => '', :practice_id => 3); puts 'Failed to import Hunter, Victoria' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Munroe', :first_name => 'Terri', :middle_name => '', :practice_id => 3); puts 'Failed to import Munroe, Terri' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Nivert', :first_name => 'Michelle', :middle_name => '', :practice_id => 3); puts 'Failed to import Nivert, Michelle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Gruhl', :first_name => 'Jared', :middle_name => '', :practice_id => 3); puts 'Failed to import Gruhl, Jared' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Fagan', :first_name => 'Steve', :middle_name => '', :practice_id => 3); puts 'Failed to import Fagan, Steve' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Edwardson', :first_name => 'Rebecca', :middle_name => '', :practice_id => 3); puts 'Failed to import Edwardson, Rebecca' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'West', :first_name => 'Patrick', :middle_name => '', :practice_id => 3); puts 'Failed to import West, Patrick' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Francis', :first_name => 'Jeff', :middle_name => '', :practice_id => 3); puts 'Failed to import Francis, Jeff' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kaminsky', :first_name => 'Tammy', :middle_name => '', :practice_id => 3); puts 'Failed to import Kaminsky, Tammy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lisanti', :first_name => 'Fred', :middle_name => '', :practice_id => 3); puts 'Failed to import Lisanti, Fred' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Seminars', :first_name => 'Wiseworld', :middle_name => '', :practice_id => 3); puts 'Failed to import Seminars, Wiseworld' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Wilson', :first_name => 'Virdina', :middle_name => '', :practice_id => 3); puts 'Failed to import Wilson, Virdina' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kooby', :first_name => 'Elli', :middle_name => '', :practice_id => 3); puts 'Failed to import Kooby, Elli' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Cooperman', :first_name => 'Ken', :middle_name => '', :practice_id => 3); puts 'Failed to import Cooperman, Ken' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Howe', :first_name => 'Matthew', :middle_name => '', :practice_id => 3); puts 'Failed to import Howe, Matthew' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Chernier', :first_name => 'Dan', :middle_name => '', :practice_id => 3); puts 'Failed to import Chernier, Dan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Moberger', :first_name => 'Bob', :middle_name => '', :practice_id => 3); puts 'Failed to import Moberger, Bob' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Voines', :first_name => 'Sophia', :middle_name => '', :practice_id => 3); puts 'Failed to import Voines, Sophia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dunbar', :first_name => 'Keith', :middle_name => '', :practice_id => 3); puts 'Failed to import Dunbar, Keith' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Machado', :first_name => 'Steven', :middle_name => '', :practice_id => 3); puts 'Failed to import Machado, Steven' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'TextUsage', :first_name => 'Check', :middle_name => '', :practice_id => 3); puts 'Failed to import TextUsage, Check' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Knopf', :first_name => 'James', :middle_name => '', :practice_id => 3); puts 'Failed to import Knopf, James' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rosenbloom', :first_name => 'Lenny', :middle_name => '', :practice_id => 3); puts 'Failed to import Rosenbloom, Lenny' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Maher', :first_name => 'Tim', :middle_name => '', :practice_id => 3); puts 'Failed to import Maher, Tim' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'McMillan', :first_name => 'Euan', :middle_name => '', :practice_id => 3); puts 'Failed to import McMillan, Euan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Yeager', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Yeager, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Burke', :first_name => 'Julie', :middle_name => '', :practice_id => 3); puts 'Failed to import Burke, Julie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Smith', :first_name => 'Anne Neglia', :middle_name => '', :practice_id => 3); puts 'Failed to import Smith, Anne Neglia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Veillette', :first_name => 'Sally', :middle_name => '', :practice_id => 3); puts 'Failed to import Veillette, Sally' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Decatrel', :first_name => 'Marta', :middle_name => '', :practice_id => 3); puts 'Failed to import Decatrel, Marta' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Katsaros', :first_name => 'Maria', :middle_name => '', :practice_id => 3); puts 'Failed to import Katsaros, Maria' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Jemison', :first_name => 'Caitlin', :middle_name => '', :practice_id => 3); puts 'Failed to import Jemison, Caitlin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Viteri', :first_name => 'Tanya', :middle_name => '', :practice_id => 3); puts 'Failed to import Viteri, Tanya' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Scott', :first_name => 'Travis', :middle_name => '', :practice_id => 3); puts 'Failed to import Scott, Travis' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Andre', :first_name => 'Francesca', :middle_name => '', :practice_id => 3); puts 'Failed to import Andre, Francesca' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Team', :first_name => 'Network', :middle_name => '', :practice_id => 3); puts 'Failed to import Team, Network' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Citrano', :first_name => 'Tom', :middle_name => '', :practice_id => 3); puts 'Failed to import Citrano, Tom' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Olson', :first_name => 'Karen', :middle_name => '', :practice_id => 3); puts 'Failed to import Olson, Karen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Greg', :first_name => 'DeLuca', :middle_name => '', :practice_id => 3); puts 'Failed to import Greg, DeLuca' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Services', :first_name => 'American Education', :middle_name => '', :practice_id => 3); puts 'Failed to import Services, American Education' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Berney', :first_name => 'Paul', :middle_name => '', :practice_id => 3); puts 'Failed to import Berney, Paul' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Amaral', :first_name => 'Christina', :middle_name => '', :practice_id => 3); puts 'Failed to import Amaral, Christina' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hilston', :first_name => 'Charlie', :middle_name => '', :practice_id => 3); puts 'Failed to import Hilston, Charlie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Reynolds', :first_name => 'Alison', :middle_name => '', :practice_id => 3); puts 'Failed to import Reynolds, Alison' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Harrison', :first_name => 'Maureen', :middle_name => '', :practice_id => 3); puts 'Failed to import Harrison, Maureen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Omeda', :first_name => 'Juan', :middle_name => '', :practice_id => 3); puts 'Failed to import Omeda, Juan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lockwood', :first_name => 'Gabriel', :middle_name => '', :practice_id => 3); puts 'Failed to import Lockwood, Gabriel' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dool', :first_name => 'Michelle', :middle_name => '', :practice_id => 3); puts 'Failed to import Dool, Michelle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Champrenaud', :first_name => 'Helene', :middle_name => '', :practice_id => 3); puts 'Failed to import Champrenaud, Helene' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Fishman', :first_name => 'Barry', :middle_name => '', :practice_id => 3); puts 'Failed to import Fishman, Barry' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Harris', :first_name => 'Sophie', :middle_name => '', :practice_id => 3); puts 'Failed to import Harris, Sophie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Miller', :first_name => 'Andra', :middle_name => '', :practice_id => 3); puts 'Failed to import Miller, Andra' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dune', :first_name => 'Natia', :middle_name => '', :practice_id => 3); puts 'Failed to import Dune, Natia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Neithold-Nash', :first_name => 'Jamie', :middle_name => '', :practice_id => 3); puts 'Failed to import Neithold-Nash, Jamie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Miller', :first_name => 'Jon', :middle_name => '', :practice_id => 3); puts 'Failed to import Miller, Jon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Abate', :first_name => 'MaryAnn', :middle_name => '', :practice_id => 3); puts 'Failed to import Abate, MaryAnn' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mullen', :first_name => 'Ailbhe', :middle_name => '', :practice_id => 3); puts 'Failed to import Mullen, Ailbhe' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Abate', :first_name => 'Joseph', :middle_name => '', :practice_id => 3); puts 'Failed to import Abate, Joseph' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Taghavi', :first_name => 'Ali', :middle_name => '', :practice_id => 3); puts 'Failed to import Taghavi, Ali' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Harris', :first_name => 'Angelo', :middle_name => '', :practice_id => 3); puts 'Failed to import Harris, Angelo' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Scheines', :first_name => 'Patricia', :middle_name => '', :practice_id => 3); puts 'Failed to import Scheines, Patricia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sacharny', :first_name => 'Renee', :middle_name => '', :practice_id => 3); puts 'Failed to import Sacharny, Renee' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Weinstein', :first_name => 'Gregory', :middle_name => '', :practice_id => 3); puts 'Failed to import Weinstein, Gregory' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Cacciatorre', :first_name => 'Michele', :middle_name => '', :practice_id => 3); puts 'Failed to import Cacciatorre, Michele' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Campbell', :first_name => 'Weam', :middle_name => '', :practice_id => 3); puts 'Failed to import Campbell, Weam' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Andreski', :first_name => 'Hannah', :middle_name => '', :practice_id => 3); puts 'Failed to import Andreski, Hannah' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Penton', :first_name => 'Rebecca', :middle_name => '', :practice_id => 3); puts 'Failed to import Penton, Rebecca' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Nicoletti', :first_name => 'Joseph and Enza', :middle_name => '', :practice_id => 3); puts 'Failed to import Nicoletti, Joseph and Enza' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'McCurdy', :first_name => 'Gib', :middle_name => '', :practice_id => 3); puts 'Failed to import McCurdy, Gib' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Warner', :first_name => 'Carla', :middle_name => '', :practice_id => 3); puts 'Failed to import Warner, Carla' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Russo', :first_name => 'Rosalba', :middle_name => '', :practice_id => 3); puts 'Failed to import Russo, Rosalba' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Caliendo', :first_name => 'Sabrina', :middle_name => '', :practice_id => 3); puts 'Failed to import Caliendo, Sabrina' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Babcock', :first_name => 'Debra', :middle_name => '', :practice_id => 3); puts 'Failed to import Babcock, Debra' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Grindle', :first_name => 'Cheryl', :middle_name => '', :practice_id => 3); puts 'Failed to import Grindle, Cheryl' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Nobels', :first_name => 'Andre', :middle_name => '', :practice_id => 3); puts 'Failed to import Nobels, Andre' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mawson', :first_name => 'Robert', :middle_name => '', :practice_id => 3); puts 'Failed to import Mawson, Robert' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Nicoletti', :first_name => 'Oriana', :middle_name => '', :practice_id => 3); puts 'Failed to import Nicoletti, Oriana' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Franzen', :first_name => 'Megan', :middle_name => '', :practice_id => 3); puts 'Failed to import Franzen, Megan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Jacobs', :first_name => 'Lena', :middle_name => '', :practice_id => 3); puts 'Failed to import Jacobs, Lena' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Asazuma', :first_name => 'Kenji', :middle_name => '', :practice_id => 3); puts 'Failed to import Asazuma, Kenji' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bedessian', :first_name => 'Linda', :middle_name => '', :practice_id => 3); puts 'Failed to import Bedessian, Linda' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Jenkins', :first_name => 'Anne', :middle_name => '', :practice_id => 3); puts 'Failed to import Jenkins, Anne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rabinowitz', :first_name => 'Marc', :middle_name => '', :practice_id => 3); puts 'Failed to import Rabinowitz, Marc' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Miceli', :first_name => 'Chiara', :middle_name => '', :practice_id => 3); puts 'Failed to import Miceli, Chiara' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Edwards', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Edwards, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Cabrera', :first_name => 'Janet', :middle_name => '', :practice_id => 3); puts 'Failed to import Cabrera, Janet' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hondorp', :first_name => 'Catherine', :middle_name => '', :practice_id => 3); puts 'Failed to import Hondorp, Catherine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lundquist', :first_name => 'Matt', :middle_name => '', :practice_id => 3); puts 'Failed to import Lundquist, Matt' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Epstein', :first_name => 'Jackie', :middle_name => '', :practice_id => 3); puts 'Failed to import Epstein, Jackie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Care', :first_name => 'Customer', :middle_name => '', :practice_id => 3); puts 'Failed to import Care, Customer' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Minutes', :first_name => 'Check', :middle_name => '', :practice_id => 3); puts 'Failed to import Minutes, Check' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Murphy', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Murphy, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Wellisz', :first_name => 'Nadia', :middle_name => '', :practice_id => 3); puts 'Failed to import Wellisz, Nadia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lavie', :first_name => 'Anita', :middle_name => '', :practice_id => 3); puts 'Failed to import Lavie, Anita' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lucev', :first_name => 'Michael', :middle_name => '', :practice_id => 3); puts 'Failed to import Lucev, Michael' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Harris', :first_name => 'Lenna', :middle_name => '', :practice_id => 3); puts 'Failed to import Harris, Lenna' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Reilly', :first_name => 'Jim', :middle_name => '', :practice_id => 3); puts 'Failed to import Reilly, Jim' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Davino', :first_name => 'Jennifer', :middle_name => '', :practice_id => 3); puts 'Failed to import Davino, Jennifer' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Adler', :first_name => 'Stephen', :middle_name => '', :practice_id => 3); puts 'Failed to import Adler, Stephen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lees', :first_name => 'Jennifer', :middle_name => '', :practice_id => 3); puts 'Failed to import Lees, Jennifer' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Schneider', :first_name => 'Lisa', :middle_name => '', :practice_id => 3); puts 'Failed to import Schneider, Lisa' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lemberger', :first_name => 'Dan', :middle_name => '', :practice_id => 3); puts 'Failed to import Lemberger, Dan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'DuBordieu', :first_name => 'Schuyler', :middle_name => '', :practice_id => 3); puts 'Failed to import DuBordieu, Schuyler' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Duckhorn', :first_name => 'Erin', :middle_name => '', :practice_id => 3); puts 'Failed to import Duckhorn, Erin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kleinman', :first_name => 'Ira', :middle_name => '', :practice_id => 3); puts 'Failed to import Kleinman, Ira' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Graber', :first_name => 'Robyn', :middle_name => '', :practice_id => 3); puts 'Failed to import Graber, Robyn' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Padmore', :first_name => 'Nyeshia', :middle_name => '', :practice_id => 3); puts 'Failed to import Padmore, Nyeshia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Zangas', :first_name => 'Tom', :middle_name => '', :practice_id => 3); puts 'Failed to import Zangas, Tom' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Julien', :first_name => 'Marisa', :middle_name => '', :practice_id => 3); puts 'Failed to import Julien, Marisa' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Notter', :first_name => 'Robert', :middle_name => '', :practice_id => 3); puts 'Failed to import Notter, Robert' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Suter', :first_name => 'Ali', :middle_name => '', :practice_id => 3); puts 'Failed to import Suter, Ali' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Das', :first_name => 'Misty', :middle_name => '', :practice_id => 3); puts 'Failed to import Das, Misty' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bonasoro', :first_name => 'Giovanna', :middle_name => '', :practice_id => 3); puts 'Failed to import Bonasoro, Giovanna' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lakretz', :first_name => 'Beth', :middle_name => '', :practice_id => 3); puts 'Failed to import Lakretz, Beth' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sutton', :first_name => 'Tim', :middle_name => '', :practice_id => 3); puts 'Failed to import Sutton, Tim' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kalanick', :first_name => 'Brooke', :middle_name => '', :practice_id => 3); puts 'Failed to import Kalanick, Brooke' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Westminster', :first_name => 'Westin', :middle_name => '', :practice_id => 3); puts 'Failed to import Westminster, Westin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Leimsider', :first_name => 'Jeffrey', :middle_name => '', :practice_id => 3); puts 'Failed to import Leimsider, Jeffrey' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Senzon', :first_name => 'Simon', :middle_name => '', :practice_id => 3); puts 'Failed to import Senzon, Simon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Barlow', :first_name => 'Amelia', :middle_name => '', :practice_id => 3); puts 'Failed to import Barlow, Amelia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Charles', :first_name => 'Blane', :middle_name => '', :practice_id => 3); puts 'Failed to import Charles, Blane' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Taylor', :first_name => 'Loulou', :middle_name => '', :practice_id => 3); puts 'Failed to import Taylor, Loulou' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Braunewell', :first_name => 'Bob', :middle_name => '', :practice_id => 3); puts 'Failed to import Braunewell, Bob' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bralove', :first_name => 'Mary', :middle_name => '', :practice_id => 3); puts 'Failed to import Bralove, Mary' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Morris', :first_name => 'Wendy', :middle_name => '', :practice_id => 3); puts 'Failed to import Morris, Wendy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Michael', :first_name => 'Paul', :middle_name => '', :practice_id => 3); puts 'Failed to import Michael, Paul' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mail', :first_name => 'Voice', :middle_name => '', :practice_id => 3); puts 'Failed to import Mail, Voice' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Jordan', :first_name => 'Amy', :middle_name => '', :practice_id => 3); puts 'Failed to import Jordan, Amy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Paolillo', :first_name => 'Johnnie', :middle_name => '', :practice_id => 3); puts 'Failed to import Paolillo, Johnnie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Delgado', :first_name => 'Jose', :middle_name => '', :practice_id => 3); puts 'Failed to import Delgado, Jose' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kennedy', :first_name => 'Karen', :middle_name => '', :practice_id => 3); puts 'Failed to import Kennedy, Karen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Smith', :first_name => 'Angela', :middle_name => '', :practice_id => 3); puts 'Failed to import Smith, Angela' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Therrien', :first_name => 'Daniel', :middle_name => '', :practice_id => 3); puts 'Failed to import Therrien, Daniel' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mehler', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Mehler, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Metcalf', :first_name => 'Anastacia', :middle_name => '', :practice_id => 3); puts 'Failed to import Metcalf, Anastacia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Graziano', :first_name => 'Jack and Catherine', :middle_name => '', :practice_id => 3); puts 'Failed to import Graziano, Jack and Catherine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bloom', :first_name => 'Tracy', :middle_name => '', :practice_id => 3); puts 'Failed to import Bloom, Tracy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sumser', :first_name => 'Steven', :middle_name => 'A', :practice_id => 3); puts 'Failed to import Sumser, Steven A.' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lindberg', :first_name => 'Danielle', :middle_name => '', :practice_id => 3); puts 'Failed to import Lindberg, Danielle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sandiford', :first_name => 'Garth', :middle_name => '', :practice_id => 3); puts 'Failed to import Sandiford, Garth' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mulligan', :first_name => 'Rose Anne', :middle_name => '', :practice_id => 3); puts 'Failed to import Mulligan, Rose Anne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Caliendo', :first_name => 'Anthony', :middle_name => '', :practice_id => 3); puts 'Failed to import Caliendo, Anthony' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'McLaughlin', :first_name => 'Amy', :middle_name => '', :practice_id => 3); puts 'Failed to import McLaughlin, Amy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Newton', :first_name => 'Paul', :middle_name => '', :practice_id => 3); puts 'Failed to import Newton, Paul' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Verduci', :first_name => 'Luigi', :middle_name => '', :practice_id => 3); puts 'Failed to import Verduci, Luigi' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rogowsky', :first_name => 'Larry', :middle_name => '', :practice_id => 3); puts 'Failed to import Rogowsky, Larry' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lieberman', :first_name => 'Ana', :middle_name => '', :practice_id => 3); puts 'Failed to import Lieberman, Ana' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kosch', :first_name => 'Tom', :middle_name => '', :practice_id => 3); puts 'Failed to import Kosch, Tom' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'International', :first_name => 'T-Mobile', :middle_name => '', :practice_id => 3); puts 'Failed to import International, T-Mobile' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kuznitz', :first_name => 'Kim', :middle_name => '', :practice_id => 3); puts 'Failed to import Kuznitz, Kim' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Gillis', :first_name => 'Donna', :middle_name => '', :practice_id => 3); puts 'Failed to import Gillis, Donna' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dowell', :first_name => 'Susan', :middle_name => '', :practice_id => 3); puts 'Failed to import Dowell, Susan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Powell', :first_name => 'Christopher', :middle_name => '', :practice_id => 3); puts 'Failed to import Powell, Christopher' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lopez', :first_name => 'Karen', :middle_name => '', :practice_id => 3); puts 'Failed to import Lopez, Karen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Wood', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Wood, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Fakier', :first_name => 'Adam', :middle_name => '', :practice_id => 3); puts 'Failed to import Fakier, Adam' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Forster', :first_name => 'Nancy', :middle_name => '', :practice_id => 3); puts 'Failed to import Forster, Nancy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kim', :first_name => 'Nicole', :middle_name => '', :practice_id => 3); puts 'Failed to import Kim, Nicole' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bruckner', :first_name => 'Dawn', :middle_name => '', :practice_id => 3); puts 'Failed to import Bruckner, Dawn' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Balance', :first_name => 'Check', :middle_name => '', :practice_id => 3); puts 'Failed to import Balance, Check' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Monkman', :first_name => 'Joe', :middle_name => '', :practice_id => 3); puts 'Failed to import Monkman, Joe' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Smorra', :first_name => 'Dominic', :middle_name => '', :practice_id => 3); puts 'Failed to import Smorra, Dominic' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Thomas', :first_name => 'Sharne', :middle_name => '', :practice_id => 3); puts 'Failed to import Thomas, Sharne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mazard', :first_name => 'Alexandra', :middle_name => '', :practice_id => 3); puts 'Failed to import Mazard, Alexandra' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Fratello', :first_name => 'Alex', :middle_name => '', :practice_id => 3); puts 'Failed to import Fratello, Alex' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Wellness', :first_name => 'Illuminare', :middle_name => '', :practice_id => 3); puts 'Failed to import Wellness, Illuminare' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mina', :first_name => 'Joseph', :middle_name => '', :practice_id => 3); puts 'Failed to import Mina, Joseph' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Giannou', :first_name => 'George', :middle_name => '', :practice_id => 3); puts 'Failed to import Giannou, George' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Burger', :first_name => 'Arlene', :middle_name => '', :practice_id => 3); puts 'Failed to import Burger, Arlene' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dreyer', :first_name => 'Doug', :middle_name => '', :practice_id => 3); puts 'Failed to import Dreyer, Doug' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Stevens', :first_name => 'Becca', :middle_name => '', :practice_id => 3); puts 'Failed to import Stevens, Becca' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Spinner', :first_name => 'Bebe', :middle_name => '', :practice_id => 3); puts 'Failed to import Spinner, Bebe' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bourque', :first_name => 'Christine', :middle_name => '', :practice_id => 3); puts 'Failed to import Bourque, Christine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Corozine', :first_name => 'Matthew', :middle_name => '', :practice_id => 3); puts 'Failed to import Corozine, Matthew' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Koch', :first_name => 'Nancy', :middle_name => '', :practice_id => 3); puts 'Failed to import Koch, Nancy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Burrell', :first_name => 'Debra', :middle_name => '', :practice_id => 3); puts 'Failed to import Burrell, Debra' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'dal Molin', :first_name => 'Christophe', :middle_name => '', :practice_id => 3); puts 'Failed to import dal Molin, Christophe' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Addarich', :first_name => 'Josette', :middle_name => '', :practice_id => 3); puts 'Failed to import Addarich, Josette' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dutcher', :first_name => 'Laurel', :middle_name => '', :practice_id => 3); puts 'Failed to import Dutcher, Laurel' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Gheza', :first_name => 'Cinzia', :middle_name => '', :practice_id => 3); puts 'Failed to import Gheza, Cinzia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hagenbarth', :first_name => 'Marcus', :middle_name => '', :practice_id => 3); puts 'Failed to import Hagenbarth, Marcus' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Clements', :first_name => 'Julie', :middle_name => '', :practice_id => 3); puts 'Failed to import Clements, Julie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Blanchard', :first_name => 'Trent', :middle_name => '', :practice_id => 3); puts 'Failed to import Blanchard, Trent' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Johnston', :first_name => 'Mary', :middle_name => '', :practice_id => 3); puts 'Failed to import Johnston, Mary' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Store', :first_name => 'iTunes', :middle_name => '', :practice_id => 3); puts 'Failed to import Store, iTunes' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Gittleman', :first_name => 'Beth', :middle_name => '', :practice_id => 3); puts 'Failed to import Gittleman, Beth' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lindemer', :first_name => 'Eric', :middle_name => '', :practice_id => 3); puts 'Failed to import Lindemer, Eric' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Henry', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Henry, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bona', :first_name => 'Enrico', :middle_name => '', :practice_id => 3); puts 'Failed to import Bona, Enrico' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Passarelli', :first_name => 'Delores', :middle_name => '', :practice_id => 3); puts 'Failed to import Passarelli, Delores' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Coleman', :first_name => 'Maureen', :middle_name => '', :practice_id => 3); puts 'Failed to import Coleman, Maureen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kralles', :first_name => 'Kelly', :middle_name => '', :practice_id => 3); puts 'Failed to import Kralles, Kelly' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Keonig', :first_name => 'Jeanne', :middle_name => '', :practice_id => 3); puts 'Failed to import Keonig, Jeanne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Belitz', :first_name => 'Jack', :middle_name => '', :practice_id => 3); puts 'Failed to import Belitz, Jack' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Feldman', :first_name => 'Jim', :middle_name => '', :practice_id => 3); puts 'Failed to import Feldman, Jim' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Purdee', :first_name => 'Nathan', :middle_name => '', :practice_id => 3); puts 'Failed to import Purdee, Nathan' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Graham', :first_name => 'Katie', :middle_name => '', :practice_id => 3); puts 'Failed to import Graham, Katie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Liebling', :first_name => 'Josh', :middle_name => '', :practice_id => 3); puts 'Failed to import Liebling, Josh' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Marshall', :first_name => 'Douglas', :middle_name => '', :practice_id => 3); puts 'Failed to import Marshall, Douglas' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Donovan', :first_name => 'Patrick', :middle_name => '', :practice_id => 3); puts 'Failed to import Donovan, Patrick' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Faber', :first_name => 'Carole', :middle_name => '', :practice_id => 3); puts 'Failed to import Faber, Carole' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kreinheder', :first_name => 'Matthew', :middle_name => '', :practice_id => 3); puts 'Failed to import Kreinheder, Matthew' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Swencionis', :first_name => 'Bonnie', :middle_name => '', :practice_id => 3); puts 'Failed to import Swencionis, Bonnie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Mollino', :first_name => 'Patricia', :middle_name => '', :practice_id => 3); puts 'Failed to import Mollino, Patricia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Emde', :first_name => 'Kevin', :middle_name => '', :practice_id => 3); puts 'Failed to import Emde, Kevin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Fratello', :first_name => 'Anne', :middle_name => '', :practice_id => 3); puts 'Failed to import Fratello, Anne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Jardim', :first_name => 'Nicole', :middle_name => '', :practice_id => 3); puts 'Failed to import Jardim, Nicole' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Ladd', :first_name => 'Barbara', :middle_name => '', :practice_id => 3); puts 'Failed to import Ladd, Barbara' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Widera', :first_name => 'Ola', :middle_name => '', :practice_id => 3); puts 'Failed to import Widera, Ola' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Factor', :first_name => 'Sarah', :middle_name => '', :practice_id => 3); puts 'Failed to import Factor, Sarah' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Larson', :first_name => 'Greta', :middle_name => '', :practice_id => 3); puts 'Failed to import Larson, Greta' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Moran', :first_name => 'Linda', :middle_name => '', :practice_id => 3); puts 'Failed to import Moran, Linda' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rosa', :first_name => 'Jacqueline', :middle_name => '', :practice_id => 3); puts 'Failed to import Rosa, Jacqueline' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kahn', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Kahn, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sunderwirth', :first_name => 'Mark', :middle_name => '', :practice_id => 3); puts 'Failed to import Sunderwirth, Mark' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Inkles', :first_name => 'Cliff', :middle_name => '', :practice_id => 3); puts 'Failed to import Inkles, Cliff' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Berg-Hynes', :first_name => 'Cindy', :middle_name => '', :practice_id => 3); puts 'Failed to import Berg-Hynes, Cindy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Gomez', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Gomez, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Stralka', :first_name => 'Matt', :middle_name => '', :practice_id => 3); puts 'Failed to import Stralka, Matt' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Merritt', :first_name => 'Pooh', :middle_name => '', :practice_id => 3); puts 'Failed to import Merritt, Pooh' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dantes', :first_name => 'Mark', :middle_name => '', :practice_id => 3); puts 'Failed to import Dantes, Mark' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Aretz', :first_name => 'Nicole', :middle_name => '', :practice_id => 3); puts 'Failed to import Aretz, Nicole' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'USA', :first_name => 'T-Mobile', :middle_name => '', :practice_id => 3); puts 'Failed to import USA, T-Mobile' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'D\'Anna', :first_name => 'Alison', :middle_name => '', :practice_id => 3); puts 'Failed to import D\'Anna, Alison' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Foti', :first_name => 'Pietro', :middle_name => '', :practice_id => 3); puts 'Failed to import Foti, Pietro' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Ayer', :first_name => 'Deb', :middle_name => '', :practice_id => 3); puts 'Failed to import Ayer, Deb' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Ducret', :first_name => 'Michelle', :middle_name => '', :practice_id => 3); puts 'Failed to import Ducret, Michelle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Jacobs', :first_name => 'Sharon', :middle_name => '', :practice_id => 3); puts 'Failed to import Jacobs, Sharon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Knapp', :first_name => 'Tom', :middle_name => '', :practice_id => 3); puts 'Failed to import Knapp, Tom' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Dumont', :first_name => 'Brian', :middle_name => '', :practice_id => 3); puts 'Failed to import Dumont, Brian' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kilmann', :first_name => 'Ralph', :middle_name => '', :practice_id => 3); puts 'Failed to import Kilmann, Ralph' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Neglia', :first_name => 'Noelle', :middle_name => '', :practice_id => 3); puts 'Failed to import Neglia, Noelle' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Witt', :first_name => 'Andy', :middle_name => '', :practice_id => 3); puts 'Failed to import Witt, Andy' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bayer', :first_name => 'Robert', :middle_name => '', :practice_id => 3); puts 'Failed to import Bayer, Robert' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Kessler', :first_name => 'Seth', :middle_name => '', :practice_id => 3); puts 'Failed to import Kessler, Seth' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Verduci', :first_name => 'Giuseppe', :middle_name => '', :practice_id => 3); puts 'Failed to import Verduci, Giuseppe' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Zuk', :first_name => 'LaVerne', :middle_name => '', :practice_id => 3); puts 'Failed to import Zuk, LaVerne' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Amaral', :first_name => 'John', :middle_name => '', :practice_id => 3); puts 'Failed to import Amaral, John' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Doyle', :first_name => 'Shannon', :middle_name => '', :practice_id => 3); puts 'Failed to import Doyle, Shannon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Carlough', :first_name => 'Margaret', :middle_name => '', :practice_id => 3); puts 'Failed to import Carlough, Margaret' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Arzt', :first_name => 'Jane', :middle_name => '', :practice_id => 3); puts 'Failed to import Arzt, Jane' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Burton', :first_name => 'Nichola', :middle_name => '', :practice_id => 3); puts 'Failed to import Burton, Nichola' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bettanini', :first_name => 'Mariangela', :middle_name => '', :practice_id => 3); puts 'Failed to import Bettanini, Mariangela' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Anello', :first_name => 'Matthew', :middle_name => '', :practice_id => 3); puts 'Failed to import Anello, Matthew' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Couluris', :first_name => 'Vicky', :middle_name => '', :practice_id => 3); puts 'Failed to import Couluris, Vicky' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Conrad', :first_name => 'Jessica', :middle_name => '', :practice_id => 3); puts 'Failed to import Conrad, Jessica' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Therrien', :first_name => 'Jacquie', :middle_name => '', :practice_id => 3); puts 'Failed to import Therrien, Jacquie' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Wilkerson', :first_name => 'Aaron', :middle_name => '', :practice_id => 3); puts 'Failed to import Wilkerson, Aaron' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Miller', :first_name => 'Rick', :middle_name => '', :practice_id => 3); puts 'Failed to import Miller, Rick' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Rodriguez', :first_name => 'Antonio', :middle_name => '', :practice_id => 3); puts 'Failed to import Rodriguez, Antonio' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sirico', :first_name => 'Robert', :middle_name => '', :practice_id => 3); puts 'Failed to import Sirico, Robert' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Tardif', :first_name => 'Sandra', :middle_name => '', :practice_id => 3); puts 'Failed to import Tardif, Sandra' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Esposito', :first_name => 'Cyrena', :middle_name => '', :practice_id => 3); puts 'Failed to import Esposito, Cyrena' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Associates', :first_name => 'Donohue', :middle_name => '', :practice_id => 3); puts 'Failed to import Associates, Donohue &' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hunter', :first_name => 'David', :middle_name => '', :practice_id => 3); puts 'Failed to import Hunter, David' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'One', :first_name => 'Capital', :middle_name => '', :practice_id => 3); puts 'Failed to import One, Capital' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Giannou', :first_name => 'Alex', :middle_name => '', :practice_id => 3); puts 'Failed to import Giannou, Alex' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Management', :first_name => 'Ditmas', :middle_name => '', :practice_id => 3); puts 'Failed to import Management, Ditmas' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hoechst', :first_name => 'Justine', :middle_name => '', :practice_id => 3); puts 'Failed to import Hoechst, Justine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Akens', :first_name => 'Mark ', :middle_name => '', :practice_id => 3); puts 'Failed to import Akens, Mark ' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Schneider', :first_name => 'Albert', :middle_name => '', :practice_id => 3); puts 'Failed to import Schneider, Albert' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Staffieri', :first_name => 'Stephen', :middle_name => '', :practice_id => 3); puts 'Failed to import Staffieri, Stephen' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lumb', :first_name => 'Jenny', :middle_name => '', :practice_id => 3); puts 'Failed to import Lumb, Jenny' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hall', :first_name => 'Joel', :middle_name => '', :practice_id => 3); puts 'Failed to import Hall, Joel' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Bloland', :first_name => 'Sue ', :middle_name => '', :practice_id => 3); puts 'Failed to import Bloland, Sue ' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sheperd', :first_name => 'Dick Noel', :middle_name => '', :practice_id => 3); puts 'Failed to import Sheperd, Dick & Noel' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Ingalls', :first_name => 'Brad', :middle_name => '', :practice_id => 3); puts 'Failed to import Ingalls, Brad' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Adams', :first_name => 'Natalia', :middle_name => '', :practice_id => 3); puts 'Failed to import Adams, Natalia' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'From the gym', :first_name => 'Damon', :middle_name => '', :practice_id => 3); puts 'Failed to import From the gym, Damon' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Flynn', :first_name => 'Tom', :middle_name => '', :practice_id => 3); puts 'Failed to import Flynn, Tom' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Weinberger', :first_name => 'Rozanna', :middle_name => '', :practice_id => 3); puts 'Failed to import Weinberger, Rozanna' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sturges', :first_name => 'Malissa', :middle_name => '', :practice_id => 3); puts 'Failed to import Sturges, Malissa' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Salvador', :first_name => 'Janine', :middle_name => '', :practice_id => 3); puts 'Failed to import Salvador, Janine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Nadler', :first_name => 'Ginny', :middle_name => '', :practice_id => 3); puts 'Failed to import Nadler, Ginny' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Roesener', :first_name => 'Carin', :middle_name => '', :practice_id => 3); puts 'Failed to import Roesener, Carin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Gambuto', :first_name => 'Julio', :middle_name => '', :practice_id => 3); puts 'Failed to import Gambuto, Julio' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lawson', :first_name => 'Heather', :middle_name => '', :practice_id => 3); puts 'Failed to import Lawson, Heather' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Shears-Wilcoxon', :first_name => 'Sunshine', :middle_name => '', :practice_id => 3); puts 'Failed to import Shears-Wilcoxon, Sunshine' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Uecker', :first_name => 'Jay', :middle_name => '', :practice_id => 3); puts 'Failed to import Uecker, Jay' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Railroad', :first_name => 'Long', :middle_name => '', :practice_id => 3); puts 'Failed to import Railroad, Long' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lumb', :first_name => 'Brian', :middle_name => '', :practice_id => 3); puts 'Failed to import Lumb, Brian' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Shamir', :first_name => 'Itai', :middle_name => '', :practice_id => 3); puts 'Failed to import Shamir, Itai' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Delabarre', :first_name => 'Elizabeth', :middle_name => '', :practice_id => 3); puts 'Failed to import Delabarre, Elizabeth' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Sq', :first_name => 'Abbey', :middle_name => '', :practice_id => 3); puts 'Failed to import Sq, Abbey' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Conto', :first_name => 'Roberto', :middle_name => '', :practice_id => 3); puts 'Failed to import Conto, Roberto' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'nysc', :first_name => 'Mike', :middle_name => '', :practice_id => 3); puts 'Failed to import nysc, Mike' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Service', :first_name => 'New', :middle_name => '', :practice_id => 3); puts 'Failed to import Service, New' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Salgado', :first_name => 'Jose', :middle_name => '', :practice_id => 3); puts 'Failed to import Salgado, Jose' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Tratner', :first_name => 'Jessica', :middle_name => '', :practice_id => 3); puts 'Failed to import Tratner, Jessica' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Shaer', :first_name => 'Brian', :middle_name => '', :practice_id => 3); puts 'Failed to import Shaer, Brian' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Trachtenberg', :first_name => 'Richard', :middle_name => '', :practice_id => 3); puts 'Failed to import Trachtenberg, Richard' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Center', :first_name => 'New', :middle_name => '', :practice_id => 3); puts 'Failed to import Center, New' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hoyt', :first_name => 'Monica', :middle_name => '', :practice_id => 3); puts 'Failed to import Hoyt, Monica' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Esquenazi', :first_name => 'Moises', :middle_name => '', :practice_id => 3); puts 'Failed to import Esquenazi, Moises' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Hammerschlag', :first_name => 'Arnold', :middle_name => '', :practice_id => 3); puts 'Failed to import Hammerschlag, Arnold' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Goldberg', :first_name => 'Emily', :middle_name => '', :practice_id => 3); puts 'Failed to import Goldberg, Emily' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Craven', :first_name => 'Dustin', :middle_name => '', :practice_id => 3); puts 'Failed to import Craven, Dustin' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Lass', :first_name => 'Inge', :middle_name => '', :practice_id => 3); puts 'Failed to import Lass, Inge' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Raspanti', :first_name => 'Larry', :middle_name => '', :practice_id => 3); puts 'Failed to import Raspanti, Larry' if pm.id == nil
  pm = PracticeMember.create(:last_name => 'Marks', :first_name => 'Christina', :middle_name => '', :practice_id => 3); puts 'Failed to import Marks, Christina' if pm.id == nil

  
  illuminare_pms = PracticeMember.where("practice_id = 3")
  puts "After import Illuminare now has #{illuminare_pms.size} pms"
  
  PracticeMember.where("practice_id = 3").each do |pm|
    pm.send(:create_travel_card_record)
  end
  
  illuminare_tcs = TravelCard.includes(:practice_member).where("practice_members.practice_id = 3")
  puts "After import Illuminare now has #{illuminare_tcs.size} Travel Cards"
  
  
end