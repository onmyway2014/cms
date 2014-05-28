require_relative '../spec_helper'
require './src/core/generator'
require './src/core/resource'
require './src/core/template_engine_factory'

module Cms

  describe Generator do

    def create_generator(engine_type, model_data, template_data, render_result)
      model_r = double 'model_resource'
      template_r = double 'template_resource'
      dest_r = double 'destination_resource'

      model_r.should_receive(:get).and_return model_data
      template_r.should_receive(:get).and_return template_data
      dest_r.should_receive(:put).with(render_result)

      template_engine = double 'template_engine'
      template_engine.should_receive(:render).with(model_data, template_data).and_return render_result

      template_engine_factory = TemplateEngineFactory.new
      template_engine_factory.should_receive(:create).with(engine_type).and_return template_engine
      TemplateEngineFactory.stub(:new).and_return template_engine_factory

      generator = Generator.new(model_r, template_r, dest_r)
      generator.engine_type = engine_type
      generator
    end


    it 'raise an exception when init argument given nil' do
      expect { Generator.new(nil, nil, nil) }.to raise_error(ArgumentError, 'model_resource is nil')
      expect { Generator.new('nil', nil, nil) }.to raise_error(ArgumentError, 'template_resource is nil')
      expect { Generator.new('nil', 'nil', nil) }.to raise_error(ArgumentError, 'destination_resource is nil')

      Generator.new('nil', 'nil', 'nil')
    end

    it 'run' do
      create_generator('test', 'model data', 'template_data', 'result data').should be_run
    end


  end
end

