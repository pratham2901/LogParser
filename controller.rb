class LogParserController
  
  def initialize
    @log_file = LogFile.new
    @current_view = FileDialogView.new
    @current_view.clear_display
    @current_view.set_cursor
    @current_view.display
   end
  
  def run
    while user_input = $stdin.getch do
    #process the input
    begin
      while next_chars=$stdin.read_nonblock(10) do
        user_input = "#{user_input}#{next_chars}"
      end
    rescue
    end
    if @current_view.quittable?.&&user_input == 'q'
      break
    else
      parse_input user_input
    end
      @current_view.display
    break
    end
  end
end
