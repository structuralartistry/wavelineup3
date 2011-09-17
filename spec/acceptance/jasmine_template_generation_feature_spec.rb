require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Visit Feature", %q{

} do

  def process_and_save_file(name, data)
    file_path = File.expand_path("#{Rails.root}/spec/javascripts/fixtures/#{name}")
    File.delete(file_path) if File.exists?(file_path)

    # escape scripts
    doc = page.body
    doc.gsub!(/<script/,'<!--<script')
    doc.gsub!(/\/script>/,'/script>-->')

    File.open(file_path, 'w') {|f| f.write(doc) }
    return File.exists?(file_path)
  end

  context "practice room" do

    before(:each) do
      Factory(:visit_view_type)
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      @practice_member = create_practice_member('Kahn, David Nathan', practice_name)

      visit("/practice_room/#{@practice_member.id}/visit/new")
      @practice_room_visit_page = page.current_url

      page.current_url =~ /\d$/
      @visit = Visit.find($&)
    end


    it "practice room paid features" do
      @practice_member.practice.package_id = 1
      @practice_member.practice.save!
      visit(@practice_room_visit_page)

      process_and_save_file('practice_room_paid.html', page.body).should == true
    end

    it "practice room free features" do
      process_and_save_file('practice_room_free.html', page.body).should == true
    end

  end

end

