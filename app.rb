require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'prawn_printer'
require 'pry'

set :raise_errors => true

class PrawnPlayground < Sinatra::Base
  get '/' do
    content_type 'application/pdf'

    doc = PrawnPrinter::Printer.new
    doc.document.render
  end
end
