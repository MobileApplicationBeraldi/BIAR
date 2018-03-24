require 'rails_helper'

class Test 
   def self.ok(a)
   end
end
 
describe Test do
    it 'add a mock method' do 
       fake_results =[double('movie'),double('movie2')]
       expect(Test).to receive(:ok2).with('hardware').and_return(fake_results)
    end
end
