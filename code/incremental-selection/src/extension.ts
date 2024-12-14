import * as vscode from 'vscode';

var selectionActive = false;

export function activate(context: vscode.ExtensionContext) {
	selectionActive = false
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)

	const disposable = vscode.commands.registerCommand('incremental-selection.toggle', () => {
		if (selectionInProgress()) {
			clearSelection()
		} else {
			startSelection()
		}
	});

	context.subscriptions.push(disposable)

	vscode.workspace.onDidChangeTextDocument(clearSelection)
}

function selectionInProgress(): boolean {
	return selectionActive
}

function startSelection() {
	selectionActive = true
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)
	if (vscode.window.activeTextEditor) {
		var editor = vscode.window.activeTextEditor;
		editor.selections = editor.selections.map(selection => new vscode.Selection(selection.active, selection.active));
	}
}

function clearSelection() {
	selectionActive = false
	vscode.commands.executeCommand('setContext', 'incremental-selection.active', selectionActive)
}

// This method is called when your extension is deactivated
export function deactivate() {}
