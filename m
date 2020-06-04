Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4A1F82E4
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:24:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 75C17420401;
	Sat, 13 Jun 2020 12:24:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0612D420433
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:10 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id x6so12245698wrm.13
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:in-reply-to:date:message-id
	:mime-version;
	bh=FkY06VvLCYQ/KGngzPaIaC4mSIkUSS8QrEtxWQX+ZKQ=;
	b=cMrNk/pnmQH/yQMcfmhnJzKMAE6NzY3dbt5m1qnt8V7/9t7VJbhtTSfyHHXEXpt4Z7
	/aAfu95XhHyaJYNOil0AmyTfS3jGoVPHz8sT/Jccv8HFTvWP6y86dq00dh+e9aTllqst
	hUR3YYf3ZTLRJntgYz+exDU6OLPHDWRG9VqKiBmP843kdGvbaHllgw2Gr5n8ScjLjoZg
	kXiE1uCZV6xxuj+Kv1uw9FI0QtDl1Wb73mnxhtCy0uC+T8ajgQ7B85IdvAmXVI8gbtft
	hJT6s73r6lpEBmInrfTmZy2DHuZIUpo0WQLR2Ntf/XovjaSEJ/VOj14xAaMaQEvJEvHA
	zeDA==
X-Gm-Message-State: AOAM530mhTCJeibFuiBfUSWkAe8HLiCT2pjFzR0272PtM7aZykxSSsZM
	MgPWKUpyQ6zERQvKB5ciajCVdz/z2sxGnJXb
X-Google-Smtp-Source: ABdhPJwHyck/iE9xzTJCUqjz19FuTNVf2IZmvqFocRcS1lFjkvNVa7sHeoaIgiYv5B6i1/Yqzb5p8w==
X-Received: by 2002:a5d:5092:: with SMTP id a18mr19070523wrt.42.1592042349487; 
	Sat, 13 Jun 2020 02:59:09 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	a14sm14827625wrv.20.2020.06.13.02.59.08
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:08 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:07 +0200
Resent-Message-ID: <20200613095907.GH4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 2118 seconds by postgrey-1.31 at mail19;
	Thu, 04 Jun 2020 10:33:33 CEST
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A754420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 10:33:32 +0200 (CEST)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
	helo=nanos.tec.linutronix.de) by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1jgklM-0007rw-IR; Thu, 04 Jun 2020 09:58:08 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
	id CB26BFFBE0; Thu,  4 Jun 2020 09:58:07 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20200603233203.1695403-2-keescook@chromium.org>
Date: Thu, 04 Jun 2020 09:58:07 +0200
Message-ID: <874krr8dps.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
	SHORTCIRCUIT=-0.0001
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, clang-built-linux@googlegroups.com,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/10] x86/mm/numa: Remove
	uninitialized_var() usage
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

Kees Cook <keescook@chromium.org> writes:
> -#ifdef NODE_NOT_IN_PAGE_FLAGS
> -	pfn_align = node_map_pfn_alignment();
> -	if (pfn_align && pfn_align < PAGES_PER_SECTION) {
> -		printk(KERN_WARNING "Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
> -		       PFN_PHYS(pfn_align) >> 20,
> -		       PFN_PHYS(PAGES_PER_SECTION) >> 20);
> -		return -EINVAL;
> +	if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {

Hrm, clever ...

> +		unsigned long pfn_align = node_map_pfn_alignment();
> +
> +		if (pfn_align && pfn_align < PAGES_PER_SECTION) {
> +			pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
> +				PFN_PHYS(pfn_align) >> 20,
> +				PFN_PHYS(PAGES_PER_SECTION) >> 20);
> +			return -EINVAL;
> +		}
>  	}
> -#endif
>  	if (!numa_meminfo_cover_memory(mi))
>  		return -EINVAL;
>  
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
> index 71283739ffd2..1a4cdec2bd29 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -100,7 +100,7 @@
>   * there.  This includes the case where there is no node, so it is implicit.
>   */
>  #if !(NODES_WIDTH > 0 || NODES_SHIFT == 0)
> -#define NODE_NOT_IN_PAGE_FLAGS
> +#define NODE_NOT_IN_PAGE_FLAGS 1

but if we ever lose the 1 then the above will silently compile the code
within the IS_ENABLED() section out.

Thanks,

        tglx
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
