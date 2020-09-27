Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5327A3EF
	for <lists+drbd-dev@lfdr.de>; Sun, 27 Sep 2020 22:08:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C152C420396;
	Sun, 27 Sep 2020 22:08:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtprelay.hostedemail.com (smtprelay0099.hostedemail.com
	[216.40.44.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E7D02420385
	for <drbd-dev@lists.linbit.com>; Sun, 27 Sep 2020 22:08:30 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 7E77118017FB8;
	Sun, 27 Sep 2020 20:08:29 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:967:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:5007:6742:7903:9025:10004:10400:11232:11658:11914:12295:12297:12740:12760:12895:13019:13069:13311:13357:13439:14181:14659:14721:21063:21080:21451:21627:30034:30054:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: toy29_471566e2717b
X-Filterd-Recvd-Size: 2021
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf19.hostedemail.com (Postfix) with ESMTPA;
	Sun, 27 Sep 2020 20:08:26 +0000 (UTC)
Message-ID: <9f6ebf51253bf420c8f6f8974a82283ae3e9e446.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-iio@vger.kernel.org
Date: Sun, 27 Sep 2020 13:08:25 -0700
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, drbd-dev@lists.linbit.com,
	"Rafael J.  Wysocki" <rafael@kernel.org>, linux-clk@vger.kernel.org,
	linux-acpi@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	Lechner <david@lechnology.com>,
	Blumenstingl <martin.blumenstingl@googlemail.com>, David@linbit.com,
	linux-block@vger.kernel.org, Martin@linbit.com,
	linux-amlogic@lists.infradead.org, Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, Thomas@linbit.com,
	Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [Drbd-dev] [PATCH 00/18] use semicolons rather than commas to
 separate statements
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

On Sun, 2020-09-27 at 21:12 +0200, Julia Lawall wrote:
> These patches replace commas by semicolons.  This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> 
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.

Thanks.

All of these appear to be correct and without effect
except for __LINE__ number changes where braces are added.



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
