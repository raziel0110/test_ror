module PlaylistsHelper
  def button_text(playlist)
    playlist.active? ? 'Active' : 'Set Active'
  end
end
