{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.editors;
in
{
  options = {
    my.${userName}.editors.vscode.enable = lib.mkEnableOption "enable vscode editor for ${userName}";
  };

  config = lib.mkIf cfg.vscode.enable {

    home-manager.users.${userName} = {
      programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
        ];

        userSettings = {
          "nix.formatterPath" = "nixfmt";
        };
        keybindings = [
          {
            "key" = "ctrl+alt+up";
            "command" = "editor.action.goToTopHover";
            "when" = "editorHoverFocused";
          }
          {
            "key" = "ctrl+alt+down";
            "command" = "editor.action.goToBottomHover";
            "when" = "editorHoverFocused";
          }
          {
            "key" = "alt+up";
            "command" = "editor.action.moveLinesUpAction";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "alt+down";
            "command" = "editor.action.moveLinesDownAction";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "alt+j";
            "command" = "editor.action.joinLines";
          }
          {
            "key" = "alt+l";
            "command" = "expandLineSelection";
            "when" = "textInputFocus";
          }
          {
            "key" = "alt+a";
            "command" = "editor.action.selectAll";
          }
          {
            "key" = "alt+c";
            "command" = "editor.action.clipboardCopyAction";
          }
          {
            "key" = "alt+v";
            "command" = "editor.action.clipboardPasteAction";
          }
          {
            "key" = "alt+x";
            "command" = "editor.action.clipboardCutAction";
          }
          {
            "key" = "alt+z";
            "command" = "undo";
          }
          {
            "key" = "alt+d";
            "command" = "editor.action.addSelectionToNextFindMatch";
            "when" = "editorFocus";
          }
          {
            "key" = "alt+f";
            "command" = "actions.find";
            "when" = "editorFocus || editorIsOpen";
          }
          {
            "key" = "alt+enter";
            "command" = "editor.action.insertCursorBelow";
            "when" = "editorTextFocus";
          }
          {
            "key" = "shift+alt+enter";
            "command" = "editor.action.insertCursorAbove";
            "when" = "editorTextFocus";
          }
          {
            "key" = "shift+alt+l";
            "command" = "editor.action.copyLinesDownAction";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "shift+alt+right";
            "command" = "cursorEndSelect";
            "when" = "textInputFocus";
          }
          {
            "key" = "shift+alt+left";
            "command" = "cursorLineStartSelect";
          }
          {
            "key" = "alt+right";
            "command" = "cursorEnd";
            "when" = "textInputFocus";
          }
          {
            "key" = "alt+left";
            "command" = "cursorLineStart";
          }
          {
            "key" = "alt+y";
            "command" = "redo";
          }
          {
            "key" = "shift+alt+[Period]";
            "command" = "editor.action.commentLine";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "alt+s";
            "command" = "workbench.action.files.save";
          }
          {
            "key" = "shift+alt+s";
            "command" = "workbench.action.files.saveAs";
          }
          {
            "key" = "alt+down";
            "command" = "editor.action.goToBottomHover";
            "when" = "editorHoverFocused";
          }
          {
            "key" = "alt+up";
            "command" = "editor.action.goToTopHover";
            "when" = "editorHoverFocused";
          }
          {
            "key" = "alt+k";
            "command" = "editor.action.deleteLines";
            "when" = "textInputFocus && !editorReadonly";
          }
          {
            "key" = "alt+o";
            "command" = "workbench.action.files.openFile";
            "when" = "true";
          }
          {
            "key" = "alt+n";
            "command" = "workbench.action.files.newUntitledFile";
          }
          {
            "key" = "alt+g";
            "command" = "workbench.action.gotoLine";
          }
          {
            "key" = "shift+alt+f";
            "command" = "workbench.action.findInFiles";
          }
          {
            "key" = "shift+alt+h";
            "command" = "workbench.action.replaceInFiles";
          }
          {
            "key" = "shift+alt+6";
            "command" = "workbench.action.zoomOut";
          }
          {
            "key" = "alt+enter";
            "command" = "editor.action.insertLineAfter";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "shift+alt+enter";
            "command" = "editor.action.insertLineBefore";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "alt+p";
            "command" = "workbench.action.quickOpen";
          }
          {
            "key" = "shift+alt+p";
            "command" = "workbench.action.showCommands";
          }
        ];
      };
    };
  };
}
