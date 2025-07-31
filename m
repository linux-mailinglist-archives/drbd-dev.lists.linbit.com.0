Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBCB17154
	for <lists+drbd-dev@lfdr.de>; Thu, 31 Jul 2025 14:35:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D7CC162300;
	Thu, 31 Jul 2025 14:35:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0363E160913
	for <drbd-dev@lists.linbit.com>; Thu, 31 Jul 2025 14:35:29 +0200 (CEST)
Received: by mail-ed1-f43.google.com with SMTP id
	4fb4d7f45d1cf-615622ed677so1249804a12.1
	for <drbd-dev@lists.linbit.com>; Thu, 31 Jul 2025 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1753965329;
	x=1754570129; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=BfOlpCwyWZg9PIkX21VWu05QVToVfyAB9n/xSH8mCvI=;
	b=uGdfeWkvblaC9xs/PPmIaMtgC8w1vY1Oy81KHRhXoVpe9PS2ao24d/MA2g9jffVK8b
	T4Sbx9RfRDydo8ToG4yvr17oDYSjAUGvPNZMoGa1wdUO6ZWnvKfGegATBQbjhsVJLXgr
	a+lGfyhK4x9BntiTfHo08hT7s97mJnfair0Nlwrud/nFCbNVCZ/GlM0BLAU+0YcnzTbW
	/17A16glBG7KovsvhU7yf+RUcy8PYGfFwRSacYIQHsVBQZ1+cTd3cTG3wXVSzsCfqP9p
	GShw5DfCHM3XQaIZ3HdMqbW6fgDB1VoGpkNOYbsxUBQT4Q/MEe5f7CurVeknYp9N1a4X
	wHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1753965329; x=1754570129;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=BfOlpCwyWZg9PIkX21VWu05QVToVfyAB9n/xSH8mCvI=;
	b=jUOdMBvdjWMKxsY19av04zD3R2Rz9A7hWC4utcFYsaKDkUlZwyFCqnWTA/d7mjZgRR
	LxKGq1kZC2wZOGL5HwFMTx7TzjRFSZXWw9JjoK8SMiqmijJXPYK3vT7s3B4G41fsmNbX
	slEP5iNo972KjR+ggJfpNM3GJtcww+FNyec6ksJ0mQxOR2uw6+GUn0PIYtrgBw23SMvZ
	n50YkCJKJ/yVr2mcTjcev40KRM0zf9KLz5gQ4+MPYQoTBQICmSEGdq5mQWgGQ+HAd55k
	bMslR68DyRycD2P4qdvNazRA4BEhEeIwbDI26QEtbXW+W64uSAt3GS7MGaJCtLrSwZDJ
	UyOQ==
X-Gm-Message-State: AOJu0YyIRT2Z+xPslz95//d5EtIYY+WA60KZjYI+WehYy5V4DNeGLiK6
	lA2Xmoq1lvufVQBtgwM2nEOdENiYfWkVNH+xvVO37qrwgwI4oIRHSpJlUcCU/TqLku9v2A8XyLk
	XPORvKDftTnuClzsNTdA1qEESM+l+mCkbMP+kKz/LjdwaUQBeKCNzsvB81A==
X-Gm-Gg: ASbGncu8pychGmwoWCYdOA/kf6IdOZGzGbXygoCfnxKlEi8hIpi93naIHnTeanVKzuK
	72MAQ8cpD6JSisrf3dm+8nIcfYvG5TdNi8MENcQ4JaJW+imhLeBgRkW5IKjUIouIJJN2PG2OsXu
	CE3eM8S0AYGRzUsSFzPQ9yUPIt7tejFfvzPrZCtNbg00GzgJvYyqUY70xK6KOeXCH8zinYPA/Ke
	0zfc0xIURWTWRSFZA==
X-Google-Smtp-Source: AGHT+IERT9Krg0H3bLCJqmxd93T/lcEkCqTSbT4CxLnBbgeWjZ9i5ySYDY/9gEWfTFTAfeKrsHOv5r1HgEqsj9K4+TY=
X-Received: by 2002:a50:8e53:0:b0:615:7e5b:7a23 with SMTP id
	4fb4d7f45d1cf-61586efdb35mr5468619a12.8.1753965329199; Thu, 31 Jul 2025
	05:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Thu, 31 Jul 2025 14:35:17 +0200
X-Gm-Features: Ac12FXwAGv2x12jAvAIvHpQPFxZmKcvUU5RLDcYLbkY1hSdTW4q-zJwMawuuj4w
Message-ID: <CADGDV=XQCgj644Hw3tnMEtnGh3WFH6YRZwekxJ9ySqMdbKwqKA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rdma: Fix kernel crash in dtr_create_rx_desc()
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Cc: drbd-dev@lists.linbit.com
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Zhengbing,

Thanks for the analysis and the patch. I took the freedom and slightly
modified it before applying it. Instead of changing the behaviour of
the dtr_path_get_cm() function I introduce a new one:
dtr_path_get_cm_connected().

Please see
https://github.com/LINBIT/drbd/commit/ae1b0bdfa2e4ea59d15199b55a6f0c571844f576

Also ...

[...]
> -       for (i = DATA_STREAM; i <= CONTROL_STREAM ; i++)
> -               dtr_create_rx_desc(&path->flow[i], GFP_NOIO);
> -

I dropped this part. It came without explanation in the commit
message. I believe that some RDMA transports require at least one
rx-descriptor to enable them to establish a connection.


Best regards,
 Philipp
