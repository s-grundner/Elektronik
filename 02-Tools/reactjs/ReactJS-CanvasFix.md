# Canvas Fix

![](assets/{F11B341C-6720-4E20-9188-A01A8150C9D2}.png)


```ts
// --- USER FIX: Canvas Issue (#38 on GitHub)
if(!ctx.sourcePath || (!ctx.containerEl?.hasClass('markdown-preview-section'))) {
    return;
}
// --- END USER FIX ---
```