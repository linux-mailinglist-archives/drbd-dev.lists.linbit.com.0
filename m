Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DA28262C
	for <lists+drbd-dev@lfdr.de>; Sat,  3 Oct 2020 21:27:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56EC9420FA6;
	Sat,  3 Oct 2020 21:27:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtprelay.hostedemail.com (smtprelay0112.hostedemail.com
	[216.40.44.112])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5238F420EF8
	for <drbd-dev@lists.linbit.com>; Sat,  3 Oct 2020 21:27:38 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id 08F8B181D330D;
	Sat,  3 Oct 2020 19:27:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3874:4321:5007:6248:6742:6743:7974:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:14777:21080:21325:21433:21627:30054:30090:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:19, LUA_SUMMARY:none
X-HE-Tag: bell15_5909bf3271af
X-Filterd-Recvd-Size: 2863
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf01.hostedemail.com (Postfix) with ESMTPA;
	Sat,  3 Oct 2020 19:27:04 +0000 (UTC)
Message-ID: <c7fd58ebd81f8731fc03434b2bdd8aa4bf99335a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Sat, 03 Oct 2020 12:27:03 -0700
In-Reply-To: <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
	<160132172369.55460.9237357219623604216.b4-ty@kernel.org>
	<b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
	<20200929113745.GB4799@sirena.org.uk>
	<db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
	<20201001110150.GA6715@sirena.org.uk>
	<f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
	<20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Valdis@linbit.com, linux-ide@vger.kernel.org,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
	Neil Armstrong <narmstrong@baylibre.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Julia Lawall <Julia.Lawall@inria.fr>, linux-acpi@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	David Lechner <david@lechnology.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
	tools@linux.kernel.org
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

On Sat, 2020-10-03 at 15:15 -0400, Konstantin Ryabitsev wrote:
> On Sat, Oct 03, 2020 at 11:40:48AM -0700, Joe Perches wrote:
> > (Adding tools and Konstantin Ryabitsev)
> > 
> > There seems to be some mismatch between b4's use of the
> > cover letter to a patch series and what maintainers that
> > apply a subset of the patches in the patch series.
> > 
> > The merge description shows the entire patch series as
> > applied, but the actual merge is only a subset of the
> > series.
> > 
> > Can this be improved in b4?
> 
> So, the following logic should be applied:
> 
> - if the entire series was applied, reply to 0/n
> - if a subset only is applied, reply to each n/n of the patch that was 
>   cherry-picked out of the series
> 
> Is that an accurate summary?

Exactly so, thanks.


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
