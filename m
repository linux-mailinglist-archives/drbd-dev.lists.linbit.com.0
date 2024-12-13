Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D99F11A7
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Dec 2024 16:59:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6013616B819;
	Fri, 13 Dec 2024 16:59:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B27A3160645
	for <drbd-dev@lists.linbit.com>; Fri, 13 Dec 2024 16:59:26 +0100 (CET)
Received: by mail-ej1-f47.google.com with SMTP id
	a640c23a62f3a-a9f1d76dab1so385674766b.0
	for <drbd-dev@lists.linbit.com>; Fri, 13 Dec 2024 07:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1734105566;
	x=1734710366; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=IA/FKVIQr3OJ5fBGFz2onxHLkiqEsc0CaiAD3HXYcPA=;
	b=pRnuTV8MHwUq+S+6SxbBVoSLM4mgwQHp19EgMzkeztp1Q9e+7QqQpR9TxGLUzL4yG3
	rA7d9Xmy+txQaJx3yDic2EY3aKt0P/vBhDbfRwYjLRPxHT78FTn9xEWKjrNg2mJ4nK7e
	o9DTAcwCBTcQwrJ6yFW6jihKPBfx0HnEzBJ0yVhIl2fzFUzywzn+B9+8BeCdaH0Ls6AI
	JOg7RLgESGbcXQhCFAOoI4sBAf9s9vXwXqJWP34ZMEPlewGdi4m5k88FPo19eJjij92u
	ThpykwhJl45Dcysodwx2pSWrsSmcqcW5qQHH4hzSllU44avhmG8qRl80L1uQYxv+8lA1
	lGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1734105566; x=1734710366;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=IA/FKVIQr3OJ5fBGFz2onxHLkiqEsc0CaiAD3HXYcPA=;
	b=WhYeu5XEZ18AI4GjdVoI51NAvK+APBlQFQ9olimAu3/I40qmFzxzvIqKF0g9CF49dQ
	qIG3Z1JdZ4GCePZZkLwq+DxcB+yeF5pM/5op01Si9935pPwswnhZ8+sXHRD4/4KWALZK
	AiVlTOAqg5e3KVJhiLj/6/eGAHUPZWehp3ws47cfPwSoiTf4ezD+DyYWWZj0ScREwcNU
	uNtkrd6IZFmx8dRdyqaLpnEmv5v7O7yPjcQdLP+vmk2j2BbOcsMTDATSBqqorAvs8SDu
	XOsDCGjDnkO6Bp0zku3fLXPyHbrJzlOwsv9MAKWkk+2FZVOTutiZppvdiJ6LcREY6vHf
	+t6w==
X-Gm-Message-State: AOJu0Yw7uEOvOgOdZ4O4atBE9atShQes1T7dJRNifBS9G8FeVEyOJK4e
	eb8axmPOrSaYJeBvCdMVVo241rXmFDGr/BwS0BGWZgnMNjHHL6uLWLlj++Mgo1rXkSvUi44ZGIE
	KXE0OXFpgwSGLnLdcb0MY9GJ5ijy77D1O9LMcpyg2ARghCjdHA0eoVg==
X-Gm-Gg: ASbGncu6tTxw2Mf/nmmFNaliWpn3u6hGs64Dh6z6cQGNrFGJwrIigCfifVNxc/zJQKv
	U81FjpGCFxV+RmZVZThFXVzP/aE4pfw0f+X350Q==
X-Google-Smtp-Source: AGHT+IHWW4Xy9rVXkNuJVpS1penONO4Ah4uJRepcdMowRJz3fwF7ifsraLwngADN8Ao8JUF5R8cxVGHhpOPGu5HsxpY=
X-Received: by 2002:a17:906:c146:b0:aa6:82e3:2103 with SMTP id
	a640c23a62f3a-aab779b7e12mr372299966b.32.1734105565796; Fri, 13 Dec 2024
	07:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20241127112048.1460255-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20241127112048.1460255-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 13 Dec 2024 16:59:14 +0100
Message-ID: <CAGNP_+V7KHBsunRO_EKhXVrw7Ly4EJ7qYCT+m2CL0fwp4ii2Xw@mail.gmail.com>
Subject: Re: [PATCH] drbd: Fix memory leak
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

> In the output of kmemleak, we have the followe backtrace:
> ...
> This is a memory leak.

Thanks for testing with kmemleak and reporting this.

> diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
> index 86535080f..48c9588eb 100644
> --- a/drbd/drbd_main.c
> +++ b/drbd/drbd_main.c
> @@ -3765,6 +3765,8 @@ struct drbd_resource *drbd_create_resource(const char *name,
>
>         list_add_tail_rcu(&resource->resources, &drbd_resources);
>
> +       resource->state_change_err_str = NULL;

This is not necessary. "resource" is allocated with "kzalloc", which
zero-initializes the memory.

> diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
> index 24ff7ab30..4102f2a04 100644
> --- a/drbd/drbd_state.c
> +++ b/drbd/drbd_state.c
> @@ -1566,6 +1566,9 @@ static __printf(2, 3) void _drbd_state_err(struct change_context *context, const
>                 *context->err_str = err_str;
>         if (context->flags & CS_VERBOSE)
>                 drbd_err(resource, "%s\n", err_str);
> +
> +       if (!context->err_str)
> +               kfree(err_str);
>  }

Good spot. I find it cleaner to rearrange the code and make this an
"else", as follows. Do you agree that this works too? Changing the
order of printing the error and assigning the "err_str" field should
not have any impact on the behavior of DRBD.

@@ -1557,10 +1557,13 @@ static __printf(2, 3) void
_drbd_state_err(struct change_context *context, const
        va_end(args);
        if (!err_str)
                return;
-       if (context->err_str)
-               *context->err_str = err_str;
        if (context->flags & CS_VERBOSE)
                drbd_err(resource, "%s\n", err_str);
+
+       if (context->err_str)
+               *context->err_str = err_str;
+       else
+               kfree(err_str);
 }


>  static __printf(2, 3) void drbd_state_err(struct drbd_resource *resource, const char *fmt, ...)
> @@ -1582,6 +1585,9 @@ static __printf(2, 3) void drbd_state_err(struct drbd_resource *resource, const
>                 *resource->state_change_err_str = err_str;
>         if (resource->state_change_flags & CS_VERBOSE)
>                 drbd_err(resource, "%s\n", err_str);
> +
> +       if (!resource->state_change_err_str)
> +               kfree(err_str);
>  }

Rearrange into "if-else" as above.

>  static enum drbd_state_rv __is_valid_soft_transition(struct drbd_resource *resource)
> @@ -5586,6 +5592,7 @@ static enum drbd_state_rv twopc_after_lost_peer(struct drbd_resource *resource,
>                 .target_node_id = -1,
>                 .flags = flags | (resource->res_opts.quorum != QOU_OFF ? CS_FORCE_RECALC : 0),
>                 .change_local_state_last = false,
> +               .err_str = NULL,

This is not necessary. Omitted fields are initialized to zero.

>         };
>
>         /* The other nodes get the request for an empty state change. I.e. they
> @@ -5915,7 +5922,8 @@ enum drbd_state_rv change_repl_state(struct drbd_peer_device *peer_device,
>                         .mask = { { .conn = conn_MASK } },
>                         .val = { { .conn = new_repl_state } },
>                         .target_node_id = peer_device->node_id,
> -                       .flags = flags
> +                       .flags = flags,
> +                       .err_str = NULL,

This is not necessary. Omitted fields are initialized to zero.

Best regards,
Joel
