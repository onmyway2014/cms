require './test/spec_helper'
require './test/model_create_helper'
require './lib/core/template_engine/haml_template_engine'

module Cms
  module Core
    describe 'Engine::HamlTemplateEngine' do
      include ModelCreateHelper
      subject { HamlTemplateEngine.new }

      it 'should result correct for html' do
        template = %q(%html
  %div="my name:#{model.name}"
  %div="children:#{model.children.count}"
)

        output = "<html>\n  <div>my name:tom</div>\n  <div>children:2</div>\n</html>\n"

        subject.render(person_tom, template).should == output
      end
    end
  end
end