local currentSprite = app.sprite
if currentSprite == nil then
    app.alert("Open a sprite first!")
    return
elseif currentSprite.colorMode ~= ColorMode.INDEXED then
    app.alert("Current sprite is not in indexed mode.")
    return
end

local dlg = Dialog { title = "Export Indices As Image" }

dlg:file {
    id = "selected_file",
    label = "Output File:",
    save = true,
    filename = currentSprite.filename:match("([^.]*).(.*)") .. ".png",
    filetypes = { "png" },
    entry = true
}

dlg:button {
    text = "Export",
    focus = true,
    onclick = function()
        local exportImageSpecs = currentSprite.spec
        exportImageSpecs.colorMode = ColorMode.GRAY
        local exportImage = Image(exportImageSpecs)
        local sourceImage = Image(currentSprite.spec)
        sourceImage:drawSprite(currentSprite, 1)
        local pc = app.pixelColor
        for it in sourceImage:pixels() do
            local index = it()
            exportImage:drawPixel(it.x, it.y, pc.graya(it()))
        end
        exportImage:saveAs(dlg.data.selected_file)
        app.alert("Index image exported.")
        dlg:close()
    end
}

dlg:button {
    text = "Cancel",
    onclick = function()
        dlg:close()
    end
}

dlg:show {
    wait = false,
    bounds = Rectangle( 200, 100, 200, 60 )
}