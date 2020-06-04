Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12E1F82DF
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:22:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A440A420403;
	Sat, 13 Jun 2020 12:22:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22F9842042F
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:00 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id y20so10156090wmi.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=8Faii11PvSo51bdsAemmq3+A0d7oNRL4/GLZ67cBSMg=;
	b=gVXHC2ygCM1p0gTiR3PTvnngBrdm7Uwm9eYB47cTMQzZlom2CcrhBKHSbPR2pxpMT2
	6wBirM4zgqkyLUt80JfLc39WIvLUDc/3LzbZMte6enuTuT25dWQt/BPY5S0NEEBsER/n
	TFY80xOYFG1JgC0yI52703/AgtLzgR39YJ0ORLGREH2FvX/jbNBo2iShqpHnDb5uAQrg
	b2C/leBZBabKS1+c01qLulr7NvZsN2ZfbVnfzJn1RmchUzyLL5MtNDPVJsEkPfohUpTT
	E2IlKFDNvvBiOcSEEubJsdgKsIGGbwCDr7U3DTwxXRRPl+U2IgDOeSVKfIgQSPr6ifgt
	/seA==
X-Gm-Message-State: AOAM532U3blWwRKq6dfzEfDY7hBDWx02biKRPSFi2/zj0JK0lXRi4ISh
	W5tFLIok8sa4/3OG3KzpNLhXu57q7HdPSBlb
X-Google-Smtp-Source: ABdhPJyrcwSRSe1yqDA8BuOk1jWaN1ykPSgzhrHqBfENwcwFBYYMQevRUGDy4xKZYoACodQSAY0gng==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr3408187wmf.151.1592042339377; 
	Sat, 13 Jun 2020 02:58:59 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	b132sm12745096wmh.3.2020.06.13.02.58.58
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:58 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:57 +0200
Resent-Message-ID: <20200613095857.GD4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79F1742030B
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 05:33:20 +0200 (CEST)
Received: by mail-oi1-f194.google.com with SMTP id t25so3846239oij.7
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=8Faii11PvSo51bdsAemmq3+A0d7oNRL4/GLZ67cBSMg=;
	b=An50kzaFvA39pC4h/8bP4oIWOqTSG046GlYB5+emgXeZszQTtbXKqSjDjHWmw8n8um
	VXpLlrq83m2ZAS8J26v56FTDUjfbdw4fWaYAjEK9Ox20DjsyL1kabqtQvJ0qaNA6AN6x
	WQHzqT/rIk17+lobg6a1Qz4niujZV9KifIFoGU6CnMcUxFKQqfbbxVvC4XVpIL5SSTtt
	6xGwnGkCkYTcRnL3OaIoBi5ReA1N/8hWVCv9k4QJ2ieUjD5HXDXWHDv6XZ9+0M+W+p2j
	GHjogeet/zLPYDJFnvbD/NGsLeEzoRiqyu6IiidyEX/Bv9x5fa84lURyrkrcSmOp3voL
	uKqQ==
X-Received: by 2002:aca:b707:: with SMTP id h7mr1938490oif.174.1591241599191; 
	Wed, 03 Jun 2020 20:33:19 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:4111:8b00::3])
	by smtp.gmail.com with ESMTPSA id n60sm327816otn.75.2020.06.03.20.33.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 20:33:17 -0700 (PDT)
Date: Wed, 3 Jun 2020 20:33:15 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200604033315.GA1131596@ubuntu-n2-xlarge-x86>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-10-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603233203.1695403-10-keescook@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>, clang-built-linux@googlegroups.com,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 09/10] treewide: Remove uninitialized_var()
	usage
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

On Wed, Jun 03, 2020 at 04:32:02PM -0700, Kees Cook wrote:
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings
> (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> either simply initialize the variable or make compiler changes.
> 
> I preparation for removing[2] the[3] macro[4], remove all remaining
> needless uses with the following script:
> 
> git grep '\buninitialized_var\b' | cut -d: -f1 | sort -u | \
> 	xargs perl -pi -e \
> 		's/\buninitialized_var\(([^\)]+)\)/\1/g;
> 		 s:\s*/\* (GCC be quiet|to make compiler happy) \*/$::g;'
> 
> drivers/video/fbdev/riva/riva_hw.c was manually tweaked to avoid
> pathological white-space.
> 
> No outstanding warnings were found building allmodconfig with GCC 9.3.0
> for x86_64, i386, arm64, arm, powerpc, powerpc64le, s390x, mips, sparc64,
> alpha, and m68k.
> 
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

<snip>

> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
> index a0f6813f4560..a71fa7204882 100644
> --- a/arch/powerpc/kvm/book3s_pr.c
> +++ b/arch/powerpc/kvm/book3s_pr.c
> @@ -1829,7 +1829,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
>  {
>  	int ret;
>  #ifdef CONFIG_ALTIVEC
> -	unsigned long uninitialized_var(vrsave);
> +	unsigned long vrsave;
>  #endif

This variable is actually unused:

../arch/powerpc/kvm/book3s_pr.c:1832:16: warning: unused variable 'vrsave' [-Wunused-variable]
        unsigned long vrsave;
                      ^
1 warning generated.

It has been unused since commit 99dae3bad28d ("KVM: PPC: Load/save
FP/VMX/VSX state directly to/from vcpu struct").

$ git grep vrsave 99dae3bad28d8fdd32b7bfdd5e2ec7bb2d4d019d arch/powerpc/kvm/book3s_pr.c
99dae3bad28d8fdd32b7bfdd5e2ec7bb2d4d019d:arch/powerpc/kvm/book3s_pr.c:  unsigned long uninitialized_var(vrsave);

I would nuke the whole '#ifdef' block.

Cheers,
Nathan
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
