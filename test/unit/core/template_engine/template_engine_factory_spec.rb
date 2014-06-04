require './test/spec_helper'
require './lib/core/template_engine/template_engine_factory'

module Cms
  module Core
    describe 'Engine::TemplateEngineFactory' do

       it 'should error when create not support engine' do
        factory = TemplateEngineFactory.new
        expect{factory.create :air}.to raise_error('not support engine:AirTemplateEngine')
       end

      it 'should create all support engine' do
        factory = TemplateEngineFactory.new
        expect{
        TemplateEngineFactory.constants(false).each do |c|
          factory.create TemplateEngineFactory.const_get(c)
        end
        }.not_to raise_error
      end
    end

  end
end