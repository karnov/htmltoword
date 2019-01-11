require 'spec_helper'

RSpec.describe 'XSLT supporting description lists' do

  it 'transforms correctly a single term and description' do
    compare_transformed_files(
      test: 'description_lists',
      test_file_name: 'test01',
      extras: false
    )
  end

  it 'transforms correctly multiple terms, single description' do
    compare_transformed_files(
      test: 'description_lists',
      test_file_name: 'test02',
      extras: false
    )
  end

  it 'transforms correctly a single term, multiple descriptions' do
    compare_transformed_files(
      test: 'description_lists',
      test_file_name: 'test03',
      extras: false
    )
  end

  it 'transforms correctly a description list nested in divs' do
    compare_transformed_files(
      test: 'description_lists',
      test_file_name: 'test04',
      extras: false
    )
  end
end
