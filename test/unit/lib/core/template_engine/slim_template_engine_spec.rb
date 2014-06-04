require './test/spec_helper'
require './test/model_create_helper'
require './lib/core/template_engine/slim_template_engine'

module Cms
  module Core

    describe 'Engine::SlimTemplateEngine' do
      include ModelCreateHelper
      subject { SlimTemplateEngine.new }
      it 'should result correct for html' do
        template = %q(
html
  div = "my name:"+ model.name
  div = "children:#{model.children.count}"
)
        output = '<html><div>my name:tom</div><div>children:2</div></html>'

        subject.render(person_tom, template).should == output
      end

    end
  end
end