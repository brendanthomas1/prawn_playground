require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'prawn'

set :raise_errors => true

class PrawnPlayground < Sinatra::Base
  get '/' do
    content_type 'application/pdf'
    color = '#000000'

    create_and_render do |pdf|
      pdf.formatted_text_box(
        [{ text: 'Hi there!', color: color }],
           valign: :center, size: 20, height: 30,
           width: 50, at: [10, 500], overflow: :shrink_to_fit,
           min_font_size: 8, single_line: true, )
    end
  end

  def create_and_render
    pdf = Prawn::Document.new
    yield pdf if block_given?
    pdf.render
  end
end
