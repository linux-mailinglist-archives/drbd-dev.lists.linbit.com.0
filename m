Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB645DC25
	for <lists+drbd-dev@lfdr.de>; Thu, 25 Nov 2021 15:16:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC58B4203BF;
	Thu, 25 Nov 2021 15:16:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2DAC420004
	for <drbd-dev@lists.linbit.com>; Thu, 25 Nov 2021 15:16:53 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id y8so4675868plg.1
	for <drbd-dev@lists.linbit.com>; Thu, 25 Nov 2021 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nbJO0TeFQmYmuVHT0afGRmY2VMRSYyjVVUuSvy6vry4=;
	b=R/+pPmvxZKazNC9VpGI/Ub1tLtIw7hk6dj7F++0F1ffWvwSWysicVwADa6F7MdUkXn
	SkgqZQR2Op9qmzanbxOXGigb4sUJHH5jBmMy2Og3dzlzihUNCX0e3iNYu1lY/3lmg7QF
	3UhFGbu26RbUqmH1ec/2dkmcf9+/YOkmEL25PhuZrMVbI0jASm0ug+iILgdFwyoZqRst
	7hplj1mktAh/69VF22roC6t6LaQonh5BCE65ZL9jgQLU9I5dLFBt9ZgSIjI+Q8JV4k/v
	na6VePuplRi9GhveDMJV+DWLHZrZnvX3TJOwl8RZJp5MOgKoIMcHQYVUQfHaXbmcSyMa
	p1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nbJO0TeFQmYmuVHT0afGRmY2VMRSYyjVVUuSvy6vry4=;
	b=oLSFCKUBAAC7ZnSITnwqo5Yp4lUlHKMjCJ1+oiZ6f4uQukkK9pSOMkweEt1i99Px77
	AeIg8UWdp6h0o0Gsf1i7bGpERGM8Rt7dnEA178om9VWyJKtSrhmlFgFzzrcaJubvJAsU
	4AOrcR9AJ5SlrMobzqJnZaSDHftzXEo3qy3/NqftsYpwGh/4G+5XtIxw1fUPYy7yyIpi
	LAgLblTMBOfTAtDUXG747q8m3iLo1HGI5GMXP3REqPF5KCLS/BXIap9mZMgoZggbuvmS
	C0GMXEU/BcjV1eJLZgFh8xp51qMtCHxycbvFJUUgB1KTyP5a7BlDfx0ojW8rUvj14pb1
	I9pA==
X-Gm-Message-State: AOAM530+HghTm2890soDPjJFUEzmP/KQTuasTY3hgUCziwKdMYz5zeJY
	pTgeVApfv5ixokSgXwIesR4=
X-Google-Smtp-Source: ABdhPJxzsSncFOIq4QNYKLSO5EyeJW+dKGjX7ILl5gnI8yiv/Yl0ERxLCbUEz1Z/VaiKrze7S52NwQ==
X-Received: by 2002:a17:90b:1650:: with SMTP id
	il16mr7303788pjb.242.1637849812919; 
	Thu, 25 Nov 2021 06:16:52 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp.
	[106.167.171.201])
	by smtp.gmail.com with ESMTPSA id j1sm3641724pfu.47.2021.11.25.06.16.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 25 Nov 2021 06:16:52 -0800 (PST)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
References: <3cbff170-582b-b6cf-0988-e0d0c9b47505@gmail.com>
Message-ID: <3c0ffc75-0e0f-1701-267b-1bedb6481b79@gmail.com>
Date: Thu, 25 Nov 2021 23:16:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3cbff170-582b-b6cf-0988-e0d0c9b47505@gmail.com>
Content-Language: en-US
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-doc@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH] docs: admin-guide/blockdev: Use subgraphs in
 node-states-8.dot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, 17 Nov 2021 18:38:14 +0900, Akira Yokosawa wrote:
> While node-states-8.dot has two digraphs, dot(1) command can not
> properly handle multiple graphs in a DOT file.
> 
> Use subgraphs and merge them into a single graph.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Philipp Reisner <philipp.reisner@linbit.com>
> Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
> ---
> Hi Jon,
> 
> I happened to spot a broken DOT script at the bottom of
> 
>     https://www.kernel.org/doc/html/latest/admin-guide/blockdev/drbd/figures.html
> 
> and managed to fix it.

Gentle ping?

        Thanks, Akira

> 
> DRBD DRIVER maintainers,
> If I'm missing something here, please let me know.
> 
>         Thanks, Akira
> --
>  .../blockdev/drbd/node-states-8.dot           | 25 +++++++++++--------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/blockdev/drbd/node-states-8.dot b/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
> index bfa54e1f8016..993f0c152ead 100644
> --- a/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
> +++ b/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
> @@ -1,13 +1,16 @@
> -digraph node_states {
> -	Secondary -> Primary           [ label = "ioctl_set_state()" ]
> -	Primary   -> Secondary 	       [ label = "ioctl_set_state()" ]
> -}
> +digraph G {
> +	compound=true;
> +	subgraph node_states {
> +		Secondary -> Primary           [ label = "ioctl_set_state()" ]
> +		Primary   -> Secondary 	       [ label = "ioctl_set_state()" ]
> +	}
>  
> -digraph peer_states {
> -	Secondary -> Primary           [ label = "recv state packet" ]
> -	Primary   -> Secondary 	       [ label = "recv state packet" ]
> -	Primary   -> Unknown 	       [ label = "connection lost" ]
> -	Secondary  -> Unknown  	       [ label = "connection lost" ]
> -	Unknown   -> Primary           [ label = "connected" ]
> -	Unknown   -> Secondary         [ label = "connected" ]
> +	subgraph peer_states {
> +		Secondary -> Primary           [ label = "recv state packet" ]
> +		Primary   -> Secondary 	       [ label = "recv state packet" ]
> +		Primary   -> Unknown 	       [ label = "connection lost" ]
> +		Secondary  -> Unknown  	       [ label = "connection lost" ]
> +		Unknown   -> Primary           [ label = "connected" ]
> +		Unknown   -> Secondary         [ label = "connected" ]
> +	}
>  }
> 
> base-commit: 53b606fa29e321352a105978726b975b42b292a4
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
