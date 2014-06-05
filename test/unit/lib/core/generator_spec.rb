require './test/spec_helper'
require './lib/core/generator'
require './lib/core/resource/resource_base'
require './lib/core/template_engine/template_engine_factory'

module Cms
  module Core
    describe 'Core::Generator' do

      def create_generator(engine_type, model_data, template_data, render_result)
        model_r = double 'model_resource'
        template_r = double 'template_resource'
        dest_r = double 'destination_resource'

        model_r.stub(:get).and_return model_data
        template_r.stub(:get).and_return template_data
        dest_r.stub(:put).with(render_result)

        template_engine = double 'template_engine'
        template_engine.stub(:render).with(model_data, template_data).and_return render_result

        template_engine_factory = TemplateEngineFactory.new
        template_engine_factory.stub(:create).with(engine_type).and_return(template_engine)
        TemplateEngineFactory.stub(:new).and_return template_engine_factory

        generator = Generator.new(model_r, template_r, dest_r)
        generator.engine_type = engine_type
        generator
      end

      context 'when run' do
        it 'raise an exception when init argument given nil' do
          expect { Generator.new(nil, nil, nil) }.to raise_error(ArgumentError, 'model_resource is nil')
          expect { Generator.new('nil', nil, nil) }.to raise_error(ArgumentError, 'template_resource is nil')
          expect { Generator.new('nil', 'nil', nil) }.to raise_error(ArgumentError, 'destination_resource is nil')

          Generator.new('nil', 'nil', 'nil')
        end

        it 'should be success' do
          g = create_generator('test', 'model data', 'template_data', 'result data')
          g.should be_run
          g.result.should be_empty
        end

        it 'when model resource return nil then failed' do
          g = create_generator('test', nil, 'template_data', 'result data')
          g.should_not be_run
          g.result.should == 'model resource get data is nil'
        end

        it 'when template resource return nil then failed' do
          g = create_generator('test', 'model data', nil, 'result data')
          g.should_not be_run
          g.result.should == 'template resource get data is empty'
        end
      end

      context 'support content_filter' do
        it 'append the content_filter' do
          g = create_generator('default', '', '', '')
          expect { g.content_filters << double('filter') }.to change(g.content_filters, :count).by 1
          #g.should have(1).result_filters
        end

        it 'should be call' do
          render_result = 'content'

          g = create_generator('default', 'model data', 'template data', render_result)
          f = double('filter')
          f.should_receive(:do?).with(render_result).and_return true

          g.content_filters << f
          g.should be_run
        end

        it 'should cancelled by filter' do
          render_result = 'content'
          filter_name = 'filter'

          g = create_generator('default', 'model data', 'template data', render_result)
          f = double('filter')
          f.should_receive(:do?).with(render_result).and_return false
          f.should_receive(:name).and_return filter_name
          g.content_filters << f

          g.should_not be_run
          g.result.should == "canceled by filter:#{filter_name}"
        end
      end

    end
  end
end

