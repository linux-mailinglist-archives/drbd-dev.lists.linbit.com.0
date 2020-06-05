Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F31EF3FB
	for <lists+drbd-dev@lfdr.de>; Fri,  5 Jun 2020 11:24:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7775F4203DB;
	Fri,  5 Jun 2020 11:24:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 312 seconds by postgrey-1.31 at mail19;
	Fri, 05 Jun 2020 11:24:24 CEST
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE7AD42021C
	for <drbd-dev@lists.linbit.com>; Fri,  5 Jun 2020 11:24:24 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
	q=dns/txt; 
	s=smtp; t=1591349065; h=Content-Type: MIME-Version: Message-ID:
	In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
	bh=rOuMTfuZSakOmsFGGhwcSiyz0vHtYC8PrlCFy1ZsKyw=;
	b=hRmQMxS6sF2MC06GXh1Geb/P69gF+lKUd0yl98auURjCiaxkKuXALwUn44R/8Yd5bZQTfwL8
	BEjdneKJN3qjWe2qnHFXvW3yrKuDvkoziRT+WUt7a9P5sKQgZrxj2aoM7JqGxjcDRKM0ZRTG
	fx1uty2rkHnLNjRYQuQCJnGps9o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YWE3MCIsICJkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
	(ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
	by smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
	5eda0df6cb04586933224239 (version=TLS1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 09:18:46
	GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 13DBAC433CB; Fri,  5 Jun 2020 09:18:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B846EC43387;
	Fri,  5 Jun 2020 09:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B846EC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
	spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Kees Cook <keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-5-keescook@chromium.org>
Date: Fri, 05 Jun 2020 12:18:22 +0300
In-Reply-To: <20200603233203.1695403-5-keescook@chromium.org> (Kees Cook's
	message of "Wed, 3 Jun 2020 16:31:57 -0700")
Message-ID: <87h7vpg9b5.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
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
Subject: Re: [Drbd-dev] [PATCH 04/10] rtlwifi: rtl8192cu: Remove
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

> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings (e.g.
> "unused variable"). If the compiler thinks it is uninitialized, either
> simply initialize the variable or make compiler changes. As a precursor
> to removing[2] this[3] macro[4], just initialize this variable to NULL,
> and avoid sending garbage by returning.
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

To which tree should this go? If something else than wireless-drivers
tree:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

But let me know if you want me to take this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
