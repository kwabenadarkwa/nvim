-- --test whether the parent snippet has content from a visual selection. If yes, put into a text  node, if no then start an insert node
-- local visualSelectionOrInsert = function(args, parent)
--   if #parent.snippet.env.LS_SELECT_RAW > 0 then
--     return sn(nil, t(parent.snippet.env.LS_SELECT_RAW))
--   else -- If LS_SELECT_RAW is empty, return a blank insert node
--     return sn(nil, i(1))
--   end
-- end
-- return {
--   s(
--     { trig = "fig", snippetType = "snippet", dscr = "A basic figure environment" },
--     fmta(
--       [[
--         \begin{figure}
--         \centering
--         \includegraphics[width=0.9\linewidth]{<>}
--         \caption{
--             \textbf{<>}
--             <>
--             }
--         \label{fig:<>}
--         \end{figure}
--
--         ]],
--       { i(1, "filename"), i(2, "captionBold"), i(3, "captionText"), i(4, "figureLabel") }
--     )
--   ),
--   s(
--     { trig = "env", snippetType = "snippet", dscr = "Begin and end an arbitrary environment" },
--     fmta(
--       [[
--         \begin{<>}
--             <>
--         \end{<>}
--         ]],
--       { i(1), i(2), rep(1) }
--     )
--   ),
--   s(
--     "textbf",
--     f(function(args, snip)
--       local res, env = {}, snip.env
--       for _, ele in ipairs(env.LS_SELECT_RAW) do
--         table.insert(res, "\\textbf{" .. ele .. "}")
--       end
--       return res
--     end, {})
--   ),
--   s(
--     { trig = "emph", dscr = "the emph command, either in insert mode or wrapping a visual selection" },
--     fmta("\\emph{<>}", { d(1, visualSelectionOrInsert) })
--   ),
-- }
