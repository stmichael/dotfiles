import * as vscode from 'vscode';

var selectionActive = false;

export function activate(context: vscode.ExtensionContext) {
	selectionActive = false
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)

	context.subscriptions.push(vscode.commands.registerCommand('incremental-selection.start', startSelection))
	context.subscriptions.push(vscode.commands.registerCommand('incremental-selection.clear', clearSelection))

	vscode.workspace.onDidChangeTextDocument(removeMarker)
}

function removeMarker() {
	selectionActive = false
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)
}

function startSelection() {
	if (selectionActive) {
		clearSelection()
	}

	selectionActive = true
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)
}

function clearSelection() {
  if (!selectionActive) {
		return
	}

	selectionActive = false
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)
	if (vscode.window.activeTextEditor) {
		var editor = vscode.window.activeTextEditor;
		editor.selections = editor.selections.map(selection => new vscode.Selection(selection.active, selection.active));
	}
}

// This method is called when your extension is deactivated
export function deactivate() {}
