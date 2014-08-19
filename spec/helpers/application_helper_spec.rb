describe ApplicationHelper, type: :helper do
   it "generates sortable links" do
       helper.stub(:params).and_return({controller: 'users', action: 'index'})
       helper.sortable("email")
   end
end
