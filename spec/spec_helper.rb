require 'rubygems'
require 'bundler/setup'
require 'htmltoword'

include Htmltoword::XSLTHelper
include Htmltoword::TemplatesHelper

def compare_transformed_files(test, test_file_name, extras: false)
  source = File.read(fixture_path(test, test_file_name, :html))
  expected_content = File.read(fixture_path(test, test_file_name, :xml))
  compare_resulting_wordml_with_expected(source, expected_content, extras: extras)
end

def compare_resulting_wordml_with_expected(html, resulting_wordml, extras: false)
  source = Nokogiri::HTML(html.gsub(/>\s+</, '><'))
  result = Htmltoword::Document.new(template_file(nil)).transform_doc_xml(source, extras)
  result.gsub!(/\s*<!--(.*?)-->\s*/m, '')
  result = remove_declaration(result)
  expect(remove_whitespace(result)).to eq(remove_whitespace(resulting_wordml))
end

def compare_numbering_xml(html, expected_xml)
  source = Nokogiri::HTML(html.gsub(/>\s+</, '><'))
  stylesheet = xslt(stylesheet_name: 'numbering')
  result = stylesheet.transform(source)
  result.xpath('//comment()').remove
  result = remove_declaration(result.to_s)
  expect(remove_whitespace(result.to_s)).to eq(remove_whitespace(expected_xml))
end

def compare_relations_xml(html, expected_xml)
  source = Nokogiri::HTML(html.gsub(/>\s+</, '><'))
  stylesheet = xslt(stylesheet_name: 'relations')
  result = stylesheet.transform(source)
  result.xpath('//comment()').remove
  result = remove_declaration(result.to_s)
  expect(remove_whitespace(result.to_s)).to eq(remove_whitespace(expected_xml))
end

private

def fixture_path(folder, file_name, extension)
  File.join(File.dirname(__FILE__), 'fixtures', folder, "#{file_name}.#{extension}")
end

#used to temporarily save documents for testing
def tmp_path(filename)
  File.join(File.dirname(__FILE__), 'tmp', "#{filename}.docx")
end

def compare_content_of_body?(wordml)
  wordml !~ /<?xml version/
end

def remove_whitespace(wordml)
  wordml.gsub(/\s+/, ' ').gsub(/>\s+</, '><').strip
end

def remove_declaration(wordml)
  wordml.sub(/<\?xml (.*?)>/, '').gsub(/\s*xmlns:(\w+)="(.*?)\s*"/, '')
end
