require './test/spec_helper'
require './test/model_create_helper'
require './lib/core/template_engine/erubis_template_engine'

module Cms
  module Core
    describe 'Engine::ErubisTemplateEngine' do
      include ModelCreateHelper

      subject { ErubisTemplateEngine.new }

      it 'should result correct for html' do
        template = 'my name:<%=model.name%>, children:<%=model.children.count%>'
        output = 'my name:tom, children:2'
        subject.render(person_tom, template).should == output

      end
    end

  end

end

