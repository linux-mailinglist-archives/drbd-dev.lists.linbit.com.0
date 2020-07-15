Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D7220A54
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Jul 2020 12:42:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC45F420306;
	Wed, 15 Jul 2020 12:42:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 307 seconds by postgrey-1.31 at mail19;
	Wed, 15 Jul 2020 12:42:31 CEST
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
	[104.130.122.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15CE24200D7
	for <drbd-dev@lists.linbit.com>; Wed, 15 Jul 2020 12:42:30 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
	q=dns/txt; 
	s=smtp; t=1594809752; h=Date: Message-Id: Cc: To: References:
	In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
	Content-Type: Sender; bh=pYgx74LtrBLVD12x3ELyZuAqEdnOVxhRlDanXsj1kC8=; 
	b=Ch3smxSru/3/noBzqrvOrBx8IyY3nt7R/SWXLE375Dz/pzCqiekG19QC0IE0HobAKM+rFlEl
	sSIOFCpIEFl8TvPvmhSlaKrIsb7jx/UtFboY2TStc/Aqvf5D43xTgNOhaqjjTKMRDKEoTRXx
	2zcCfElTl4Cgmb+0iNcg6o/6hDo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YWE3MCIsICJkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
	(ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
	by smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
	5f0edc4d512812c070d07b76 (version=TLS1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Jul 2020 10:37:01
	GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 3EE01C433AF; Wed, 15 Jul 2020 10:37:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
	MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
	[88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 639D1C433CA;
	Wed, 15 Jul 2020 10:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 639D1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
	spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200620033007.1444705-5-keescook@chromium.org>
References: <20200620033007.1444705-5-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200715103701.3EE01C433AF@smtp.codeaurora.org>
Date: Wed, 15 Jul 2020 10:37:01 +0000 (UTC)
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 04/16] b43: Remove uninitialized_var()
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

Kees Cook <keescook@chromium.org> wrote:

> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings (e.g.
> "unused variable"). If the compiler thinks it is uninitialized, either
> simply initialize the variable or make compiler changes. As a precursor
> to removing[2] this[3] macro[4], just initialize this variable to NULL.
> No later NULL deref is possible due to the early returns outside of the
> (phy->rev >= 7 && phy->rev < 19) case, which explicitly tests for NULL.
> 
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> Fixes: 58619b14d106 ("b43: move under broadcom vendor directory")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

2 patches applied to wireless-drivers-next.git, thanks.

800e7a205a0f b43: Remove uninitialized_var() usage
f8279dad4e36 rtlwifi: rtl8192cu: Remove uninitialized_var() usage

-- 
https://patchwork.kernel.org/patch/11615573/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
