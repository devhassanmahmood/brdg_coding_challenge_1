class CopyBaseController < ApplicationController

  def copy
    if params[:since].present?
      render json: copy_data_since, status: :ok
    else
      render json: @copy_data, status: :ok
    end
  end


  def key_specified_value
    copy_value = keys_value(params[:key])
    render json: { value: replace_key_value(copy_value) }, status: :ok
  end

  def refresh
    Airtable.call
    render json: {}, status: :ok
  end


  private

  def replace_key_value(value)
    value.gsub(/\{(.*?)\}/) do |key|
      q_param = content(key)
      if q_param.include?('datetime')
       q_param = q_param.split(',').first
       date = params[q_param].to_i
       Time.at(date).strftime("%a %h %m %H:%M:%S%p")
      else
        params[q_param]? params[q_param] : find_in_copy_data(q_param)
      end
    end
  end

  def find_in_copy_data(key)
    nested_value = keys_value(key)
    replace_key_value(nested_value)
  end

  def keys_value(key)
    copy_value = ''
    @copy_data['records'].each do |row|
      if row['fields']['Key'].downcase.eql?(key.downcase)
        copy_value = row['fields']['Copy']
      end
    end

    copy_value
  end

  def content(key)
    key[/{(.+)}/, 1]
  end

  def copy_data_since
    data = JSON.parse(Airtable.call(false))
    data['records'] - @copy_data['records']
  end
end
