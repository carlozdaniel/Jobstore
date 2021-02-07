class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, to: :@template
  def text_field name, *args
    options = args.extract_options!
    if options.has_key?(:class)
      options[:class] += "form-control"
    else
      options[:class] = "form-control"
    end  
    content_tag :div, class:"form-group" do 
      content_tag(:label,name, name: name) + super(name,options)
   
    end
  end
end