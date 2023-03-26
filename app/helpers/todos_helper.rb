module TodosHelper

  def edit_button id
    button_to :edit, edit_todo_path(id), method: :get, data: { turbo_stream: true }
  end

  def delete_button id
    button_to :delete, todo_path(id), method: :delete
  end

  def cancel_button id
    button_to :cancel, todo_path(id), method: :get, data: { "turbo_stream": true }
  end
end
