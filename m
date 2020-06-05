Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B21EF407
	for <lists+drbd-dev@lfdr.de>; Fri,  5 Jun 2020 11:26:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C7B584203E1;
	Fri,  5 Jun 2020 11:26:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 314 seconds by postgrey-1.31 at mail19;
	Fri, 05 Jun 2020 11:26:19 CEST
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
	[104.130.122.27])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DB48420311
	for <drbd-dev@lists.linbit.com>; Fri,  5 Jun 2020 11:26:19 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
	q=dns/txt; 
	s=smtp; t=1591349180; h=Content-Type: MIME-Version: Message-ID:
	In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
	bh=kOyRDD2wM/7haweFJ6NAJPQaW5V0bTz8j0qf/YEB3F8=;
	b=lInecL5w/Zee01P78f8q0YxLz+URsZCmOp/gl27Gf80ndo537D+YQez+2+fYVYPjY4ziZJpU
	aM+JMuzR4uPlRhZaEpO6/uj6upnrXzwd7oqLf607eGofM1zM77KPqtqhIMSD/bLjVcM+JqVK
	MJUIv6q/9pCmzSyZzgi39e0zJb4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YWE3MCIsICJkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
	(ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
	by smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
	5eda0e7eb65440fdbaa50f41 (version=TLS1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 09:21:02
	GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 464A0C433A1; Fri,  5 Jun 2020 09:21:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0979DC433C6;
	Fri,  5 Jun 2020 09:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0979DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
	spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Kees Cook <keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-4-keescook@chromium.org>
Date: Fri, 05 Jun 2020 12:20:55 +0300
In-Reply-To: <20200603233203.1695403-4-keescook@chromium.org> (Kees Cook's
	message of "Wed, 3 Jun 2020 16:31:56 -0700")
Message-ID: <87d06dg96w.fsf@tynnyri.adurom.net>
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
Subject: Re: [Drbd-dev] [PATCH 03/10] b43: Remove uninitialized_var() usage
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
> and make the (unreachable!) code do a conditional test.
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

[...]

> @@ -4256,9 +4256,13 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
>  			pga_gain = (table[i] >> 24) & 0xf;
>  			pad_gain = (table[i] >> 19) & 0x1f;
>  			if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
> -				rfpwr_offset = rf_pwr_offset_table[pad_gain];
> +				rfpwr_offset = rf_pwr_offset_table
> +						? rf_pwr_offset_table[pad_gain]
> +						: 0;
>  			else
> -				rfpwr_offset = rf_pwr_offset_table[pga_gain];
> +				rfpwr_offset = rf_pwr_offset_table
> +						? rf_pwr_offset_table[pga_gain]
> +						: 0;

To me this is ugly, isn't there a better way to fix this?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
