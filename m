Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id B823972E15
	for <lists+drbd-dev@lfdr.de>; Wed, 24 Jul 2019 13:48:44 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id EAC7D101AC48;
	Wed, 24 Jul 2019 13:48:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 24633101AC43
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 13:48:41 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id z1so46612132wru.13
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 04:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6ja8qOZBd/+yPpakrfgGOO9Lsjgvj3+ENbjktOu7PQg=;
	b=P/Uz1vqQq8oTd7cuw88+8LKg4UMpx/GPMqE8FjyIKrALHxccYwxrrS5IA0bnYBWN2z
	AiPq/PW8v6DI6Rj+Fta0BYE0v7+XUbhdpjc3/s3kijRktL+u6AdV6STGtga6cTCBSiqt
	k2V2MxsWYugo60P9luWE+sT/58/mo9CpZx1it+vKxBV5qljjcO6F+gIKzTGPCHqa+R/U
	ga2kJT5ZpI6bXSb6sUsAROUihfuMumxnDD+RA3pNVCZqpMso+DHB/NIIrH3AM4EvcIKX
	8nqTtsWPpihGh7iIzDYcoCGE1273gk6xYTy865HsxclPsMHiYhBEZUqE6/SwHX+oDrZ6
	UjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6ja8qOZBd/+yPpakrfgGOO9Lsjgvj3+ENbjktOu7PQg=;
	b=Zpn7PruFRsOPMJXz1amXv2rHqMhENN461csztnrY6Wtk0t04xct3aFPLzZwFdPPrP3
	VisGic2GFDhXLMJii6JGKhTFBuwenfP8/pLGgf+dFxzL4/hIrHtdnVVj/sF0zO5uUuB0
	CZ4aHnpUwKyBndBtz1klotMEMGIZG50zRfZSLSNdqZzrC1IcV4n8qJOGAAKi57TlJaKJ
	hue7z//lEdVn5mE79YkfF/kFaTRU3CeslJKa0kDQXZJde33a2UUa3poExQbm3ybrLupO
	WOetbAa/aunT8uMKgdiLlBIFR3SwgLm6cvsct/sfQKuRFkfmv/pjERPNtqw/vE8f3NaM
	j+uw==
X-Gm-Message-State: APjAAAUfJ4x5XetXG5wWUmgMtSAiiwBKj4Gg9rV85bOHXwpDoVDcMsZa
	T1hBIui8/I6qezRtMvXuP9FaU/6O
X-Google-Smtp-Source: APXvYqxtbimswj1+iqEbPXS+959hF1x39IRwg6ckgQ3h6RiygXt2444TSZdS5jTfDlL37IKCtELZKw==
X-Received: by 2002:adf:e883:: with SMTP id d3mr91261045wrm.330.1563968921330; 
	Wed, 24 Jul 2019 04:48:41 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	g11sm46247726wru.24.2019.07.24.04.48.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jul 2019 04:48:40 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:48:39 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <20190724114839.fl3ldycrn3zwfgaw@rck.sh>
References: <20190724034916.28703-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724034916.28703-1-baijiaju1990@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 1/2] block: drbd: Fix a possible null-pointer
 dereference in receive_protocol()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Jul 24, 2019 at 11:49:16AM +0800, Jia-Ju Bai wrote:
> In receive_protocol(), when crypto_alloc_shash() on line 3754 fails,
> peer_integrity_tfm is NULL, and error handling code is executed.
> In this code, crypto_free_shash() is called with NULL, which can cause a
> null-pointer dereference, because:
> crypto_free_shash(NULL)
>     crypto_ahash_tfm(NULL)
>         "return &NULL->base"
> 
> To fix this bug, peer_integrity_tfm is checked before calling
> crypto_free_shash().
> 
> This bug is found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

Reviewed-by: Roland Kammerer <roland.kammerer@linbit.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
