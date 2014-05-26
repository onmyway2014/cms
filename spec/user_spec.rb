require 'spec_helper'
require_relative '../src/user'


  describe User do
    subject {User.new}
    it 'name is john' do

      subject.name.should == 'john'
    end


  end


