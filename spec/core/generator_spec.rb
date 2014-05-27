require_relative '../spec_helper'
require './src/core/generator'
require './src/core/resource'
require './src/core/template_engine_factory'

module Cms
  describe Generator do

    it 'raise an exception when init argument given nil' do
      expect { Generator.new(nil, nil, nil) }.to raise_error(ArgumentError, 'model_resource is nil')
      expect { Generator.new('nil', nil, nil) }.to raise_error(ArgumentError, 'template_resource is nil')
      expect { Generator.new('nil', 'nil', nil) }.to raise_error(ArgumentError, 'destination_resource is nil')

      Generator.new('nil', 'nil', 'nil')
    end

    it 'run' do
      model_r = double 'model_resource'
      template_r = double 'template_resource'
      dest_r = double 'destination_resource'
      engine = Generator.new(model_r, template_r, dest_r)

      model_data = 'model data'
      template_data = 'template data'
      render_result = 'result'

      model_r.should_receive(:get).and_return model_data
      template_r.should_receive(:get).and_return template_data
      dest_r.should_receive(:put).with(render_result)

      template_engine = double 'template_engine'
      template_engine.should_receive(:render).with(model_data, template_data).and_return render_result

      template_engine_factory = TemplateEngineFactory.new
      template_engine_factory.should_receive(:engine).and_return template_engine
      TemplateEngineFactory.stub(:new).and_return template_engine_factory

      engine.run
      engine.should be_success
    end


  end
end

