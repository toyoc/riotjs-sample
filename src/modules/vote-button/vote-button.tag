vote-button
  button
    img(src="{opts.image}" width="{opts.width}" height="{opts.height}")
    span.name
      <yield />
    span.count { opts.count }
  style.
    button {
      border-radius: 6px;
      border: 0;
      background: #efefef;
      box-shadow: 0 0 1px 1px rgba(0,0,0,0.8);
      display: inline-flex;
      justify-content: center;
      align-items: center;
    }
    .name {
      margin-left: 10px;
    }
    .count {
      border-radius: 4px;
      padding: 2px;
      background: #333;
      color: white;
      margin-left: 10px;
    }
