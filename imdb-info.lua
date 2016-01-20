--[[
 IMDB media information viewer
 Author: Achute Sharma
--]]
-- global variables
dlg = nil
movieName = nil
movieYear = nil
btSearch = nil
mediaPlot = nil
imdbRating = nil
-- functions
function descriptor()
    return { title = "IMDB media-info viewer" ;
             version = "0.1" ;
             author = "Achute Sharma" ;
             shortdesc = "View the movie/media information from IMDB";
             capabilities = {}
           }
end

function activate()
    dlg = vlc.dialog("IMDB media information Viewer")
    local mediaLabel = dlg:add_label("Name : ",1,2,1,1)
    local item = vlc.input.item()
    if(item == nil) then title="Enter Movie Title" else title=item:name() end
    movieName=dlg:add_text_input(title, 2, 2, 2, 1)
    local yearLabel = dlg:add_label("Year : ",1,3,1,1)
    year=""
    movieYear= dlg:add_text_input(year,2,3,1,1)
    btSearch = dlg:add_button("Search",searchIMDB,4,3,1,1)
    title=item:name()
    mediaPlot=dlg:add_html("Plot:",1,4,4,4)
    local rateLabel=dlg:add_label("IMDB Rating :",1,9,1,1)
    imdbRating=dlg:add_label("0.0",2,9,1,1)
end

function searchIMDB()
  local url = "http://www.omdbapi.com/?"
  title = movieName:get_text()
  year = movieYear:get_text()
  if(title ~= nil and title ~= "") then url = url .. "&t=" .. title .. "&y=" .. year .. "&plot=full&r=xml"end
  local stream = vlc.stream(url)
  if stream == nil then vlc.msg.err("[IMDB Viewer] omdbapi.com isn't reachable") return false end

  reading = "this string left intentionally empty"
  xmlpage = ""
  while(reading ~= nil and reading ~= "") do
    reading = stream:read(65653)
    if(reading) then
      xmlpage = xmlpage .. reading
    end
  end
  if xmlpage == "" then
    vlc.msg.err("[IMDB] couldn't download media information")
    return false
  end
  local xmltext = string.gsub(xmlpage, "<%?xml version=\"1%.0\" encoding=\"utf%-8\"%?>", "")
  info =""
  i,j = string.find(xmltext,"plot")
  k,l = string.find(xmltext,"language")
  if (j==nil) then info="NO Info found" else info = string.sub(xmltext,j+2,k-1) end
  imdbRate ="0.0"
  i,j = string.find(xmltext,"imdbRating")
  k,l = string.find(xmltext,"imdbVotes")
  if (j==nil) then info="NO Info found" else imdbRate = string.sub(xmltext,j+2,k-1) end


  mediaPlot:set_text(info)
  imdbRating:set_text(imdbRate)


end

function deactivate()

end

function close()
    vlc.deactivate()
end
