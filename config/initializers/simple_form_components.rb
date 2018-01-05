module SimpleForm
  module Components
    module Tooltips
      def tooltip(wrapper_options = nil)
        unless tooltip_text.nil?
          input_html_options[:rel] ||= 'tooltip'
          input_html_options['data-toggle'] ||= 'tooltip'
          input_html_options['data-placement'] ||= tooltip_position
          input_html_options['data-trigger'] ||= 'focus'
          input_html_options['data-original-title'] ||= tooltip_text
          nil
        end
      end

      def tooltip_text
        tooltip = options[:tooltip]
        if tooltip.is_a?(String)
          tooltip
        elsif tooltip.is_a?(Array)
          tooltip[1]
        else
          nil
        end
      end

      def tooltip_position
        tooltip = options[:tooltip]
        tooltip.is_a?(Array) ? tooltip[0] : "right"
      end
    end

    module Icons
      def icon(wrapper_options = nil)
        return icon_class unless options[:icon].nil?
      end

      def icon_class
        icon_tag = template.content_tag(:i, '', class: options[:icon])
      end
    end
    
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Icons)
SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Tooltips)
