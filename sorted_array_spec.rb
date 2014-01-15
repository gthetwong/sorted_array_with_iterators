require 'rspec'
require './sorted_array.rb'

#shared example is a method in rspec used for testing functionality
shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should == source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el} }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map do
        shared_examples "yield to all elements in sorted array"do |method|
            specify do 
            expect do |b| 
            sorted_array.send(method, &b) 
          end.to yield_successive_args(2,3,4,7,9) 
        end
      end
    end 

        it 'creates a new array containing the values returned by the block' do
            
        end
      end
    end

    describe "that update the original array" do
      describe :map! do
        it 'the original array should be updated' do
        # sorted_array map! should equal sorted_array.
        sorted_array.map! {|el| el} == sorted_array.internal_arr
        # it 'the original array should be updated' do
        #   original_array = sorted_array.internal_arr
        #   sorted_array.map! {|el| el }.should_not eq sorted_array
        end
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          # pending "this is just the same as the example above"
          sorted_array.map! {|x| x*3} == source.map{|x| x*3}
        end
      end
    end
  end

  describe :find do
    # it_should_behave_like "yield to all elements in sorted array", :find

    it "should stop when the block value is true" do
      pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-find"
    
  end

  describe :inject do
     specify do 
      expect do |b| 
        block_with_two_args = Proc.new {|acc,el| acc + el}
        sorted_array.send(:+, block_with_two_args)
      end.to yield_successive_args([0,2],[2,3],[5,4],[9,7],[16,9])
    end

    it "does not currently have any examples for it" do
      pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-inject"
    end
  end
end
